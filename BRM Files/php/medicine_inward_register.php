<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action']=='all') {
	//retrieving  the medicine_inward_register
	$rec=$db->qry("SELECT DISTINCT mi.invoice_no, mi.invoice_date , mi.invoice_amount, mi.medicinepo_id,s.name FROM medicine_inward_register as mi JOIN supplier as s ON mi.supplier_id = s.id");

	echo json_encode($rec);
}

if($_GET['action']=='specific_inward' AND $_GET['medicine_po_id'] !== '') {
	//getting the specific_inward with particular medicine_po_id
	$rec=$db->qry("SELECT * FROM medicine_inward_register as mi JOIN supplier as s ON mi.supplier_id= s.id AND mi.medicinepo_id = '" . $_GET['medicine_po_id'] . "' JOIN store AS st ON mi.store_id = st.id JOIN medicines as m ON m.med_id = mi.item_id ORDER BY mi.medicinepo_id DESC");

	echo json_encode($rec);
}

if($_GET['action']== 'add')
{
	//Inserting the data to medicine_inward
	extract($_POST);
	//print_r($medicine_inward);
	
	$medicine_inward_store_id = $medicine_inward['medicine_inward_store_id'];
	$medicine_inward_supplier_id = $medicine_inward['medicine_inward_supplier_id'];
	$medicine_inward_po_id = $medicine_inward['medicine_inward_po_id'];
	$medicine_inward_invoiceno = $medicine_inward['medicine_inward_invoiceno'];
	$medicine_inward_invoicedate = date("Y-m-d", strtotime($medicine_inward['medicine_inward_invoicedate']));

	$medicine_inward_invoiceamt = $medicine_inward['medicine_inward_invoiceamt'];
	$medicine_inward_user_id = $medicine_inward['medicine_inward_user_id'];
	$medicine_inward_received_date = date("Y-m-d", strtotime($medicine_inward['medicine_inward_received_date']));
 
	foreach ($medicine_inward['items_list'] as $medicine_items) {
		
		if ($medicine_items['present_rec_qty'] > 0) {

            $res_for_last_sequence = $db->qry("SELECT MAX(medicine_sequence_no) AS medicine_sequence_no FROM medicine_sequence_nos;");
            
            if ($res_for_last_sequence[0]['medicine_sequence_no']){
                $start_sequence_no = $res_for_last_sequence[0]['medicine_sequence_no'] + 1;
                $end_sequence_no = ($start_sequence_no + (double) $medicine_items['present_rec_qty'] + (double) $medicine_items['free']) - 1;
            }else{
                $start_sequence_no = 1;
                $end_sequence_no = ($start_sequence_no + (double) $medicine_items['present_rec_qty'] + (double) $medicine_items['free']) - 1;
            }

            $ins_mi_register = "INSERT INTO medicine_inward_register SET 
                                    store_id = '" . $medicine_inward_store_id . "',
                                    supplier_id = '" . $medicine_inward_supplier_id . "',
                                    medicinepo_id = '" . $medicine_inward_po_id . "',
                                    invoice_no = '" . $medicine_inward_invoiceno . "',
                                    invoice_date = '" . $medicine_inward_invoicedate . "',
                                    invoice_amount = '" . $medicine_inward_invoiceamt . "',
                                    item_id = '" . $medicine_items['item_id'] . "',
                                    item_qty = '" . $medicine_items['item_qty'] . "',
                                    item_rec_qty = '" . $medicine_items['present_rec_qty'] . "',
                                    free = '" . $medicine_items['free'] . "',
                                    item_pend_qty = '" . $medicine_items['item_pend_qty'] . "',
                                    item_amount = '" . $medicine_items['item_net_amount'] . "',
                                    received_date = '" . $medicine_inward_received_date . "',
                                    user_id = '" . $medicine_inward_user_id . "',
                                    batch_no = '" . $medicine_items['batch_no'] . "',
                                    expiry_date = '" . date("Y-m-d", strtotime($medicine_items['expiry_date'])) . "',
                                    start_sequence = '" . $start_sequence_no . "',
                                    end_sequence = '" . $end_sequence_no . "'";
            
            $stock_count = $db->count('medicine_stock_id', 'medicine_stock_register', 'WHERE store_id = "' . $medicine_inward_store_id . '" AND item_id = "' . $medicine_items['item_id'] . '" AND batch_no = "'. $medicine_items['batch_no'] .'" AND expiry_date = "'. date("Y-m-d", strtotime($medicine_items['expiry_date'])) .'"');
            
            if ($stock_count > 0) {
                
                $get_stock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE store_id = '" . $medicine_inward_store_id . "' AND item_id = '" . $medicine_items['item_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['expiry_date'])) ."'");
                
                $quantity = $get_stock_reg[0]['quantity'];
                $quantity += (((double) $medicine_items['present_rec_qty'] + (double) $medicine_items['free']) * $medicine_items['mpo_boxpack']);
                
                $update_stock_reg = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $quantity . "' WHERE store_id = '" . $medicine_inward_store_id . "' AND item_id = '" . $medicine_items['item_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['expiry_date'])) ."'");
                
            } else {

                $quantity = (((double) $medicine_items['present_rec_qty'] + (double) $medicine_items['free']) * $medicine_items['mpo_boxpack']);
                $insert_stock_reg = $db->qry("INSERT INTO medicine_stock_register SET 
                                                store_id = '" . $medicine_inward_store_id . "',
                                                item_id = '" . $medicine_items['item_id'] . "',
                                                quantity = '" . $quantity . "',
										        batch_no = '". $medicine_items['batch_no'] ."',
                                                expiry_date = '". date("Y-m-d", strtotime($medicine_items['expiry_date'])) ."'");
			}
            
            $update_po_data = $db->qry("UPDATE medicines_podata SET mpo_qty_received = '" . ($medicine_items['present_rec_qty'] + $medicine_items['previous_rec_qty']) . "' WHERE mpo_id = '" . $medicine_items['mpo_id'] . "'");
            
            $res_mi_register = $db->qry($ins_mi_register);

            for ($sequence_no = $start_sequence_no; $sequence_no <= $end_sequence_no; $sequence_no++) {

                $ins_sequence_nos = $db->qry("INSERT INTO medicine_sequence_nos SET
													medicine_po_id = '" . $medicine_inward_po_id . "',
                                                    item_id = '" . $medicine_items['item_id'] . "',
                                                    medicine_sequence_no = '" . $sequence_no . "'");
            }
        }
	}

    $get_received_status = $db->qry("SELECT count(mpo_id) AS mpo_id FROM medicines_podata WHERE medicine_po_id = " . $medicine_inward_po_id . " AND mpo_qty_received <> mpo_qty");

    if((int) $get_received_status[0]['mpo_id'] == 0) {
        $update_po_status = $db->qry("UPDATE medicines_pos SET medicinepo_status = 'Received' WHERE medicinepo_id = " . $medicine_inward_po_id);
    }

	echo json_encode($res_mi_register);
}

if ($_GET['action'] === 'add_ob') {
//Inserting the open balance
	extract($_POST);
	
	$medicine_ob_store_id = $medicine_ob['medicine_ob_store_id'];
	$medicine_ob_user_id = $medicine_ob['medicine_ob_user_id'];
	$medicine_ob_received_date = date("Y-m-d", strtotime($medicine_ob['medicine_ob_received_date']));
 
	foreach ($medicine_ob['ob_items_list'] as $ob_items) {
		
		if ($ob_items['ob_item_qty'] > 0) {

			$res_for_last_sequence = $db->qry("SELECT MAX(medicine_sequence_no) AS medicine_sequence_no FROM medicine_sequence_nos;");
			
			if ($res_for_last_sequence[0]['medicine_sequence_no']){
				$start_sequence_no = $res_for_last_sequence[0]['medicine_sequence_no'] + 1;
				$end_sequence_no = ($start_sequence_no + $ob_items['ob_item_qty']) - 1;
			}else{
				$start_sequence_no = 1;
				$end_sequence_no = ($start_sequence_no + $ob_items['ob_item_qty']) - 1;
			}

            $ins_mi_ob_register = "INSERT INTO medicine_inward_register SET 
										store_id = '" . $medicine_ob_store_id . "',
										item_id = '" . $ob_items['ob_item_id'] . "',
										mrp = '" . $ob_items['ob_item_mrp'] . "',
										purchase_price = '" . $ob_items['ob_item_pp'] . "',
										item_qty = '" . $ob_items['ob_item_qty'] . "',
										received_date = '" . $medicine_ob_received_date . "',
										user_id = '" . $medicine_ob_user_id . "',
										start_sequence = '" . $start_sequence_no . "',
										end_sequence = '" . $end_sequence_no . "',
										batch_no = '" . $ob_items['ob_batch_no'] . "',
										expiry_date = '" . date("Y-m-d", strtotime($ob_items['ob_expiry_date'])) . "'";
            
			
            $stock_count = $db->count('medicine_stock_id', 'medicine_stock_register', 'WHERE store_id = "' . $medicine_ob_store_id . '" AND item_id = "' . $ob_items['ob_item_id'] . '" AND batch_no = "'. $ob_items['ob_batch_no'] .'" AND expiry_date = "'. date("Y-m-d", strtotime($ob_items['ob_expiry_date'])) .'"');

            if ($stock_count > 0) {

                $get_stock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE store_id = '" . $medicine_ob_store_id . "' AND item_id = '" . $ob_items['ob_item_id'] . "' AND batch_no = '". $ob_items['ob_batch_no'] ."' AND expiry_date = '" . date("Y-m-d", strtotime($ob_items['ob_expiry_date'])) ."'");

                $quantity = $get_stock_reg[0]['quantity'];
                $quantity += $ob_items['ob_item_qty'];
                $quantity += ((double) $ob_items['ob_item_qty'] * $ob_items['ob_box_pack']);

                $update_stock_reg = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $quantity . "' WHERE store_id = '" . $medicine_ob_store_id . "' AND item_id = '" . $ob_items['ob_item_id'] . "' AND batch_no = '". $ob_items['ob_batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($ob_items['ob_expiry_date'])) . "'");

            } else {

				echo $quantity = ((double) $ob_items['ob_item_qty'] * $ob_items['ob_box_pack']);
				
                $insert_stock_reg = $db->qry("INSERT INTO medicine_stock_register SET 
                                                store_id = '" . $medicine_ob_store_id . "',
                                                item_id = '" . $ob_items['ob_item_id'] . "',
                                                quantity = '" . $quantity ."',
												batch_no = '". $ob_items['ob_batch_no'] ."',
                                                expiry_date = '". date("Y-m-d", strtotime($ob_items['ob_expiry_date'])) ."'");
            }

            $res_mi_ob_register = $db->qry($ins_mi_ob_register);

            for ($sequence_no = $start_sequence_no; $sequence_no <= $end_sequence_no; $sequence_no++) {

            	$ins_sequence_nos = $db->qry("INSERT INTO medicine_sequence_nos SET
            										item_id = '" . $ob_items['ob_item_id'] . "',
            										medicine_sequence_no = '" . $sequence_no . "'");
            }
        }
	}

	echo json_encode($res_mi_ob_register);
}

//Add Direct Purchase Order Details
if($_GET['action'] === 'add_direct_po') {

    extract($_POST);

    foreach($directPo['items_list'] AS $medicine_items) {

        $res_for_last_sequence = $db->qry("SELECT MAX(medicine_sequence_no) AS medicine_sequence_no FROM medicine_sequence_nos;");
            
        if ($res_for_last_sequence[0]['medicine_sequence_no']){
            $start_sequence_no = $res_for_last_sequence[0]['medicine_sequence_no'] + 1;
            $end_sequence_no = ($start_sequence_no + $medicine_items['mpo_qty']) - 1;
        }else{
            $start_sequence_no = 1;
            $end_sequence_no = ($start_sequence_no + $medicine_items['mpo_qty']) - 1;
        }

        $insertDirectPoDetail = $db->qry("INSERT INTO medicine_inward_register SET 
                                            store_id = '" . $directPo['store_id'] . "',
                                            supplier_id = '" . $directPo['supplier_id'] . "',
                                            invoice_no = '" . $directPo['invoice_no'] . "',
                                            invoice_date = '" . date("Y-m-d", strtotime($directPo['invoice_date'])) . "',
                                            invoice_amount = '" . $directPo['net_amount'] . "',
                                            item_id = '" . $medicine_items['mpo_item_id'] . "',
                                            item_rec_qty = '" . $medicine_items['mpo_qty'] . "',
                                            item_amount = '" . $medicine_items['amount'] . "',
                                            received_date = '" . $medicine_inward_received_date . "',
                                            user_id = '" . $directPo['user_id'] . "',
                                            batch_no = '" . $medicine_items['batch_no'] . "',
                                            expiry_date = '" . date("Y-m-d", strtotime($medicine_items['exp_date'])) . "',
                                            start_sequence = '" . $start_sequence_no . "',
                                            end_sequence = '" . $end_sequence_no . "'");


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

?>