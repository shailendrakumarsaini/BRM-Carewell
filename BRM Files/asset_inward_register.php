<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action']=='all') {
    //Get all asset inward data.

	$rec=$db->qry("SELECT DISTINCT a.invoice_no, a.invoice_date ,a.invoice_amount,a.assetpo_id,s.name FROM asset_inward_register as a JOIN supplier as s ON a.supplier_id= s.id");

	echo json_encode($rec);
}

if($_GET['action']=='specific_inward' AND $_GET['asset_po_id'] !== '') {
    //Get specific inward details.
    
	$rec=$db->qry("SELECT * FROM asset_inward_register as a JOIN supplier as s ON a.supplier_id= s.id AND a.assetpo_id = '" . $_GET['asset_po_id'] . "' JOIN store AS st ON a.store_id = st.id JOIN assets as ab ON ab.asset_id=a.item_id ORDER BY a.assetpo_id DESC");

	echo json_encode($rec);
}


if($_GET['action']== 'add') {
    //Add new asset inward.

	extract($_POST);
	
	//print_r($asset_inward);
	
	$asset_inward_store_id = $asset_inward['asset_inward_store_id'];
	$asset_inward_supplier_id = $asset_inward['asset_inward_supplier_id'];
	$asset_inward_po_id = $asset_inward['asset_inward_po_id'];
	$asset_inward_invoiceno = $asset_inward['asset_inward_invoiceno'];
	$asset_inward_invoicedate = date("Y-m-d", strtotime($asset_inward['asset_inward_invoicedate']));

	$asset_inward_invoiceamt = $asset_inward['asset_inward_invoiceamt'];
	$asset_inward_user_id = $asset_inward['asset_inward_user_id'];
	$asset_inward_received_date = date("Y-m-d", strtotime($asset_inward['asset_inward_received_date']));

	if ($asset_inward_invoiceamt === '') {
		
		$asset_inward_invoiceamt = 0;
	}
 
	foreach ($asset_inward['items_list'] as $inward_items) {
		
		//$received_date = date("Y-m-d", strtotime($inward_items['received_date']));

		if ($inward_items['present_rec_qty'] > 0) {

			$res_for_last_sequence = $db->qry("SELECT MAX(asset_sequence_no) AS asset_sequence_no FROM asset_sequence_nos;");
			
			if ($res_for_last_sequence[0]['asset_sequence_no'])
			{
				$start_sequence_no = $res_for_last_sequence[0]['asset_sequence_no'] + 1;
				$end_sequence_no = ($start_sequence_no + $inward_items['present_rec_qty']) - 1;
			}
			else
			{
				$start_sequence_no = 1;
				$end_sequence_no = ($start_sequence_no + $inward_items['present_rec_qty']) - 1;
			}

            $ins_ai_register = "INSERT INTO asset_inward_register SET 
                                    store_id = '" . $asset_inward_store_id . "',
                                    supplier_id = '" . $asset_inward_supplier_id . "',
                                    assetpo_id = '" . $asset_inward_po_id . "',
                                    invoice_no = '" . $asset_inward_invoiceno . "',
                                    invoice_date = '" . $asset_inward_invoicedate . "',
                                    invoice_amount = '" . $asset_inward_invoiceamt . "',
                                    item_id = '" . $inward_items['item_id'] . "',
                                    item_qty = '" . $inward_items['item_qty'] . "',
                                    item_rec_qty = '" . $inward_items['present_rec_qty'] . "',
                                    item_pend_qty = '" . $inward_items['item_pend_qty'] . "',
                                    item_amount = '" . $inward_items['item_net_amount'] . "',
                                    received_date = '" . $asset_inward_received_date . "',
                                    user_id = '" . $asset_inward_user_id . "',
                                    start_sequence = '" . $start_sequence_no . "',
                                    end_sequence = '" . $end_sequence_no . "'";
            
            $stock_count = $db->count('asset_stock_id', 'asset_stock_register', 'WHERE store_id = "' . $asset_inward_store_id . '" AND item_id = "' . $inward_items['item_id'] . '"');
            
            if ($stock_count > 0) {
                
                $get_stock_reg=$db->qry("SELECT quantity FROM asset_stock_register WHERE store_id = '" . $asset_inward_store_id . "' AND item_id = '" . $inward_items['item_id'] . "'");
                
                $quantity = $get_stock_reg[0]['quantity'];
                $quantity += $inward_items['present_rec_qty'];
                
                $update_stock_reg=$db->qry("UPDATE asset_stock_register SET quantity = '" . $quantity . "' WHERE store_id = '" . $asset_inward_store_id . "' AND item_id = '" . $inward_items['item_id'] . "'");
                
            } else {
                
                $insert_stock_reg = $db->qry("INSERT INTO asset_stock_register SET 
                                                store_id = '" . $asset_inward_store_id . "',
                                                item_id = '" . $inward_items['item_id'] . "',
                                                quantity = '" . $inward_items['present_rec_qty'] . "'");
            }
            
            $update_po_data=$db->qry("UPDATE assets_podata SET apo_qty_received = '" . ($inward_items['present_rec_qty'] + $inward_items['previous_rec_qty']) . "' WHERE apo_id = '" . $inward_items['apo_id'] . "'");
            
            $res_ai_register = $db->qry($ins_ai_register);

            for ($sequence_no = $start_sequence_no; $sequence_no <= $end_sequence_no; $sequence_no++) {

            	$ins_sequence_nos = $db->qry("INSERT INTO asset_sequence_nos SET
            										asset_po_id = '" . $asset_inward_po_id . "',
            										item_id = '" . $inward_items['item_id'] . "',
            										asset_sequence_no = '" . $sequence_no . "'");
            }
        }
	}

	echo json_encode($res_ai_register);
}

if ($_GET['action'] === 'add_ob') {
    //Add new asset inward ob opening balance.

	extract($_POST);
   	
	$asset_ob_store_id = $asset_ob['asset_ob_store_id'];
	$asset_ob_user_id = $asset_ob['asset_ob_user_id'];
	$asset_ob_received_date = date("Y-m-d", strtotime($asset_ob['asset_ob_received_date']));
 
	foreach ($asset_ob['ob_items_list'] as $ob_items) {
		
		//$received_date = date("Y-m-d", strtotime($inward_items['received_date']));

		if ($ob_items['ob_item_qty'] > 0) {

			$res_for_last_sequence = $db->qry("SELECT MAX(asset_sequence_no) AS asset_sequence_no FROM asset_sequence_nos;");
			
			if ($res_for_last_sequence[0]['asset_sequence_no'])
			{
				$start_sequence_no = $res_for_last_sequence[0]['asset_sequence_no'] + 1;
				$end_sequence_no = ($start_sequence_no + $ob_items['ob_item_qty']) - 1;
			}
			else
			{
				$start_sequence_no = 1;
				$end_sequence_no = ($start_sequence_no + $ob_items['ob_item_qty']) - 1;
			}

            $ins_ai_ob_register = "INSERT INTO asset_inward_register SET 
                                    store_id = '" . $asset_ob_store_id . "',
                                    item_id = '" . $ob_items['ob_item_id'] . "',
                                    item_qty = '" . $ob_items['ob_item_qty'] . "',
                                    received_date = '" . $asset_ob_received_date . "',
                                    user_id = '" . $asset_ob_user_id . "',
                                    start_sequence = '" . $start_sequence_no . "',
                                    end_sequence = '" . $end_sequence_no . "',
                                    opening_balance = '" . $ob_items['ob_opening_balance'] . "'";
            
            $stock_count = $db->count('asset_stock_id', 'asset_stock_register', 'WHERE store_id = "' . $asset_ob_store_id . '" AND item_id = "' . $ob_items['ob_item_id'] . '"');
            
            if ($stock_count > 0) {
                
                $get_stock_reg=$db->qry("SELECT quantity FROM asset_stock_register WHERE store_id = '" . $asset_inward_store_id . "' AND item_id = '" . $ob_items['ob_item_id'] . "'");
                
                $quantity = $get_stock_reg[0]['quantity'];
                $quantity += $ob_items['ob_item_qty'];
                
                $update_stock_reg=$db->qry("UPDATE asset_stock_register SET quantity = '" . $quantity . "' WHERE store_id = '" . $asset_inward_store_id . "' AND item_id = '" . $ob_items['ob_item_id'] . "'");
            } else {
                
                $insert_stock_reg = $db->qry("INSERT INTO asset_stock_register SET 
                                                store_id = '" . $asset_ob_store_id . "',
                                                item_id = '" . $ob_items['ob_item_id'] . "',
                                                quantity = '" . $ob_items['ob_item_qty'] . "'");
            }
            
            $res_ai_ob_register = $db->qry($ins_ai_ob_register);

            for ($sequence_no = $start_sequence_no; $sequence_no <= $end_sequence_no; $sequence_no++) {

            	$ins_sequence_nos = $db->qry("INSERT INTO asset_sequence_nos SET
            										item_id = '" . $ob_items['ob_item_id'] . "',
                                                    asset_sequence_no = '" . $sequence_no . "'");
            }
        }
	}

	echo json_encode($res_ai_ob_register);
}
?>