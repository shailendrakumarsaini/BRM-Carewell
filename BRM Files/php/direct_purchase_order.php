<?php
    include_once ("dbclass.php");
    $db = new db();

    //Get all direct purchase order
    if($_GET['action'] === 'get_all_direct_po_data') {
        $getAllDirectPoData = $db->qry("SELECT dpo.*, sp.name AS supplier_name, s.store_name FROM DirectPO AS dpo JOIN supplier AS sp ON sp.id = dpo.supplierId JOIN store AS s ON s.id = dpo.storeId");
        echo json_encode($getAllDirectPoData);
    }

    //Get all details of specific direct purchase order.
    if($_GET['action'] === 'get_all_direct_po_details_data' && $_GET['directPOId'] !== null) {

        $getAllDirectPoDetailsData = $db->qry("SELECT dpo.*, dpod.*, sp.name AS supplier_name, s.store_name, m.med_name, t.tax_name, t.tax_percent FROM DirectPO AS dpo JOIN DirectPODetails AS dpod ON dpod.directPOId = dpo.directPOId JOIN supplier AS sp ON sp.id = dpo.supplierId JOIN store AS s ON s.id = dpo.storeId JOIN medicines AS m ON m.med_id = dpod.medicineId JOIN tax_master AS t ON t.tax_id = dpod.taxId WHERE dpo.directPOId = " . $_GET['directPOId']);

        echo json_encode($getAllDirectPoDetailsData);
    }


    //Previous direct purchase order details of medicine.
    if($_GET['action'] === 'getMedicinePreviousDetails' && $_GET['med_id'] !== null) {

        $res = $db->qry("SELECT dpod.mrp, dpod.free, dpod.purchasePrice, dpo.invoiceNo, sp.name AS supplier_name, m.med_boxpack FROM DirectPODetails AS dpod JOIN DirectPO AS dpo ON dpo.directPOId = dpod.directPOId JOIN supplier AS sp ON sp.id = dpo.supplierId JOIN medicines AS m ON m.med_id = dpod.medicineId WHERE medicineId = " . $_GET['med_id'] . " ORDER BY dpod.detailId DESC LIMIT 0,1");

        echo json_encode($res);
    }

    //Add Direct Purchase Order Details
    if($_GET['action'] === 'add_direct_po') {

        extract($_POST);
        print_r($_POST);

        $insertDirectPo = $db->qry("INSERT INTO DirectPO SET 
                                        supplierId = '" . $directPo['supplier_id'] . "',
                                        storeId = '" . $directPo['store_id'] . "',
                                        invoiceNo = '" . $directPo['invoice_no'] . "',
                                        invoiceDate = '" . date("Y-m-d", strtotime($directPo['invoice_date'])) . "',
                                        discount = '" . $directPo['discount'] . "',
                                        totalAmount = '" . $directPo['total_amount'] . "',
                                        netAmount = '" . $directPo['net_amount'] . "',
                                        createdUser = '" . $directPo['user_id'] . "',
                                        updatedUser = '" . $directPo['user_id'] . "'");

        $directPOId = $db->id();
        foreach($directPo['items_list'] AS $medicine_items) {

            $insertDirectPoDetail = $db->qry("INSERT INTO DirectPODetails SET 
                                                directPOId = '" . $directPOId . "',
                                                medicineId = '" . $medicine_items['mpo_item_id'] . "',
                                                batchNo = '" . $medicine_items['batch_no'] . "',
                                                quantity = '" . $medicine_items['mpo_qty'] . "',
                                                free = '" . $medicine_items['free'] . "',
                                                expiryDate = '" . date("Y-m-d", strtotime($medicine_items['exp_date'])) . "',
                                                mrp = '" . $medicine_items['mpo_mrp'] . "',
                                                purchasePrice = '" . $medicine_items['mpo_pp'] . "',
                                                amount = '" . $medicine_items['amount'] . "',
                                                amountTax = '" . $medicine_items['amount_tax'] . "',
                                                taxId = '" . $medicine_items['tax_id'] . "',
                                                createdUser = '" . $directPo['user_id'] . "',
                                                updatedUser = '" . $directPo['user_id'] . "'");


            $stock_count = $db->count('medicine_stock_id', 'medicine_stock_register', 'WHERE store_id = "' . $directPo['store_id'] . '" AND item_id = "' . $medicine_items['mpo_item_id'] . '" AND batch_no = "'. $medicine_items['batch_no'] .'" AND expiry_date = "'. date("Y-m-d", strtotime($medicine_items['exp_date'])) .'"');
            
            if ($stock_count > 0) {
                
                $get_stock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE store_id = '" . $directPo['store_id'] . "' AND item_id = '" . $medicine_items['mpo_item_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['exp_date'])) ."'");
                
                $quantity = $get_stock_reg[0]['quantity'];
				
                $quantity += (((double) $medicine_items['mpo_qty'] + (double) $medicine_items['free']) * (int) $medicine_items['box_pack']);
                
                $update_stock_reg = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $quantity . "' WHERE store_id = '" . $directPo['store_id'] . "' AND item_id = '" . $medicine_items['mpo_item_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['exp_date'])) ."'");
                
            } else {

                $insert_stock_reg = $db->qry("INSERT INTO medicine_stock_register SET 
                                                store_id = '" . $directPo['store_id'] . "',
                                                item_id = '" . $medicine_items['mpo_item_id'] . "',
                                                quantity = '" . (((double) $medicine_items['mpo_qty'] + (double) $medicine_items['free']) * (int) $medicine_items['box_pack']) . "',
										        batch_no = '". $medicine_items['batch_no'] ."',
										        expiry_date = '". date("Y-m-d", strtotime($medicine_items['exp_date'])) ."'");
            }
        }

        echo json_encode($insertDirectPoDetail);
    }


    if($_GET['action'] === 'add_direct_purchase_os') {

        extract($_POST);
        print_r($_POST);

        foreach($directPoOs['os_items_list'] AS $medicine_items) {

            $insertDirectPoDetail = $db->qry("INSERT INTO DirectPODetails SET 
                                                medicineId = '" . $medicine_items['med_id'] . "',
                                                batchNo = '" . $medicine_items['batch_no'] . "',
                                                quantity = '" . $medicine_items['mpo_qty'] . "',
                                                free = '" . $medicine_items['free'] . "',
                                                expiryDate = '" . date("Y-m-d", strtotime($medicine_items['exp_date'])) . "',
                                                mrp = '" . $medicine_items['mpo_mrp'] . "',
                                                purchasePrice = '" . $medicine_items['mpo_pp'] . "',
                                                amount = '" . $medicine_items['amount'] . "',
                                                amountTax = '" . $medicine_items['amount_tax'] . "',
                                                taxId = '" . $medicine_items['tax_id'] . "',
                                                createdUser = '" . $directPoOs['user_id'] . "',
                                                updatedUser = '" . $directPoOs['user_id'] . "'");


            $stock_count = $db->count('medicine_stock_id', 'medicine_stock_register', 'WHERE store_id = "' . $directPoOs['store_id'] . '" AND item_id = "' . $medicine_items['med_id'] . '" AND batch_no = "'. $medicine_items['batch_no'] .'" AND expiry_date = "'. date("Y-m-d", strtotime($medicine_items['exp_date'])) .'"');
            
            if ($stock_count > 0) {
                
                $get_stock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE store_id = '" . $directPoOs['store_id'] . "' AND item_id = '" . $medicine_items['med_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['exp_date'])) ."'");
                
                $quantity = $get_stock_reg[0]['quantity'];
                $quantity += (((double) $medicine_items['mpo_qty'] + (double) $medicine_items['free']) * (int) $medicine_items['box_pack']);
                
                $update_stock_reg = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $quantity . "' WHERE store_id = '" . $directPoOs['store_id'] . "' AND item_id = '" . $medicine_items['med_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['exp_date'])) ."'");
                
            } else {

                $insert_stock_reg = $db->qry("INSERT INTO medicine_stock_register SET 
                                                store_id = '" . $directPoOs['store_id'] . "',
                                                item_id = '" . $medicine_items['med_id'] . "',
                                                quantity = '" . (((double) $medicine_items['mpo_qty'] + (double) $medicine_items['free']) * (int) $medicine_items['box_pack']) . "',
										        batch_no = '". $medicine_items['batch_no'] ."',
										        expiry_date = '". date("Y-m-d", strtotime($medicine_items['exp_date'])) ."'");
            }
        }

        echo json_encode($insertDirectPoDetail);
    }
	
    if($_GET['action'] == 'medicine_search' && $_GET['search_string'] !== '')  {
        
        /* $get_medicines = $db->qry("SELECT * FROM  medicines WHERE (	med_name LIKE '%" . $_GET['search_string'] . "%' )"); */
        
        $get_medicines = $db->qry("SELECT m.med_id, m.med_group_id, m.med_category, m.med_name, m.med_brand, m.med_combination, m.med_allow_sale,m.med_sale_units, m.med_distributed_units, m.med_tax, m.med_status, m.med_reorder, m.med_code, m.med_hsncode,m.med_manufacturedby,m.med_schedule, m.med_purchasepack, m.med_no_of_units, m.med_boxpack, m.med_rockno, i.ig_id, i.ig_name, t.tax_name, t.tax_percent FROM medicines AS m JOIN item_group AS i ON m.med_group_id = i.ig_id JOIN tax_master AS t ON t.tax_id = m.med_tax WHERE (m.med_name LIKE '%" . $_GET['search_string'] . "%'  ) LIMIT 10 ");
        
        echo json_encode($get_medicines);
    }
?>