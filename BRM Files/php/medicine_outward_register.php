<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action']=='all') {
    //Get all medicine outward data.
	$rec=$db->qry("SELECT transaction_id, from_store_name, to_store_name, transaction_date, batch_no, expiry_date FROM medicine_outward_register");
	echo json_encode($rec);
}


if($_GET['action']=== 'store'){
	//get the storedata from the store_status
	$rec=$db->qry("select * from store where store_status=1");
	echo json_encode($rec);	
}

if($_GET['action'] === 'transcation_id' && $_GET['transcation_id'] !== '') {
    //Get specific transaction details. 
	$rec=$db->qry("SELECT * FROM medicine_outward_register AS mo JOIN medicines AS m ON mo.item_id = m.med_id AND mo.transaction_id = '" . $_GET['transcation_id'] . "' JOIN medicine_inward_register AS mi ON mi.item_id = mo.item_id");
	echo json_encode($rec);
}

if($_GET['action'] === 'add') {
    //Add new medicine outward.
    extract($_POST);
	$res_for_transaction_id = $db->qry("SELECT MAX(transaction_id) AS transaction_id FROM medicine_outward_register");
	if ($res_for_transaction_id[0]['transaction_id']){
		$transaction_id = $res_for_transaction_id[0]['transaction_id'] + 1;
	}else{
		$transaction_id = 1;
	}
	$mo_fromstore_id = $medicine_outward['ao_fromstore_id'];
	$mo_fromstore_name = $medicine_outward['ao_fromstore_name'];
	$mo_tostore_id = $medicine_outward['ao_tostore_id'];
	$mo_tostore_name = $medicine_outward['ao_tostore_name'];
	$mo_transactiontime = date("Y-m-d h:i:s");
	$mo_user_id = $medicine_outward['ao_user_id'];
	
	foreach ($medicine_outward['medicines_list'] as $outward_items) {
				
		$ins_mo_register = "INSERT INTO medicine_outward_register SET 
								transaction_id = '" . $transaction_id . "',
								from_store_id = '" . $mo_fromstore_id . "',
								from_store_name = '" . $mo_fromstore_name . "',
								to_store_id = '" . $mo_tostore_id . "',
								to_store_name = '" . $mo_tostore_name . "',
								item_id = '" . $outward_items['item_id'] . "',
								quantity = '" . $outward_items['quantity'] . "',
								received_quantity = '" . $outward_items['received_quantity'] . "',
								batch_no = '" . $outward_items['batch_no'] . "',
								expiry_date = '" . $outward_items['expiry_date'] . "',
								transaction_date = '" . $mo_transactiontime . "',
								user_id = '" . $mo_user_id . "'";
								
		$ao_rec = $db->qry($ins_mo_register);
		
		$get_fromstock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE medicine_stock_id = '" . $outward_items['medicine_stock_id'] . "'");
		
		$from_quantity = $get_fromstock_reg[0]['quantity'];
		$from_quantity -= $outward_items['received_quantity'];
		
		$update_from_store= $db->qry("UPDATE medicine_stock_register SET quantity = '" . $from_quantity . "' WHERE medicine_stock_id = '" . $outward_items['medicine_stock_id'] . "'");
		
        $stock_count = $db->count("medicine_stock_id", "medicine_stock_register", "WHERE store_id = '" . $mo_tostore_id . "' AND item_id = '" . $outward_items['item_id'] . "' AND batch_no = '" . $outward_items['batch_no'] . "' AND expiry_date = '" . $outward_items['expiry_date'] . "'");
            
		if ($stock_count > 0) {
			
			$get_tostock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE store_id = '" . $mo_tostore_id . "' AND item_id = '" . $outward_items['item_id'] . "' AND batch_no = '" . $outward_items['batch_no'] . "' AND expiry_date = '" . $outward_items['expiry_date'] . "'");
		
			$to_quantity = $get_tostock_reg[0]['quantity'];
			$to_quantity += $outward_items['received_quantity'];
			
			$update_tostock = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $to_quantity . "' WHERE store_id = '" . $mo_tostore_id . "' AND item_id = '" . $outward_items['item_id'] . "' AND batch_no = '" . $outward_items['batch_no'] . "' AND expiry_date = '" . $outward_items['expiry_date'] . "'");
			
		} else {
			$insert_tostock_reg = $db->qry("INSERT INTO medicine_stock_register SET 
											store_id = '" . $mo_tostore_id . "',
											item_id = '" . $outward_items['item_id'] . "',
											quantity = '" . $outward_items['received_quantity'] . "',
											batch_no = '" . $outward_items['batch_no'] . "',
											expiry_date = '" . $outward_items['expiry_date'] . "'");
		}
	}
	echo json_encode($ao_rec);
}
?>