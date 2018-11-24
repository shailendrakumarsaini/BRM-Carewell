<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action']=='all') {
    //Get all asset outward data.
    
	$rec=$db->qry("SELECT DISTINCT ao.transaction_id, ao.from_store_name, ao.to_store_name, ao.transaction_date FROM asset_outward_register AS ao");
	echo json_encode($rec);
}

if($_GET['action']== 'store'){
$rec=$db->qry("select * from store where store_status=1");
	echo json_encode($rec);	
}

if($_GET['action'] === 'transcation_id' && $_GET['transcation_id'] !== '') {
    //Get specific transaction details.
    
	$rec=$db->qry("SELECT * FROM asset_outward_register AS ao JOIN assets AS a ON ao.item_id = a.asset_id AND ao.transaction_id = '" . $_GET['transcation_id'] . "'");
	echo json_encode($rec);
}

if($_GET['action']== 'add') {
    //Add new asset outward.

	extract($_POST);
	
	$res_for_transaction_id = $db->qry("SELECT MAX(transaction_id) AS transaction_id FROM asset_outward_register;");
	if ($res_for_transaction_id[0]['transaction_id'])
	{
		$transaction_id = $res_for_transaction_id[0]['transaction_id'] + 1;
	}
	else
	{
		$transaction_id = 1;
	}
	
	$ao_fromstore_id = $asset_outward['ao_fromstore_id'];
	$ao_fromstore_name = $asset_outward['ao_fromstore_name'];
	$ao_tostore_id = $asset_outward['ao_tostore_id'];
	$ao_tostore_name = $asset_outward['ao_tostore_name'];
	
	$ao_transactiontime = date("Y-m-d h:i:s");
	$ao_user_id = $asset_outward['ao_user_id'];
	
	foreach ($asset_outward['items_list'] as $outward_items) {
				
		$ins_ao_register = "INSERT INTO asset_outward_register SET 
								transaction_id = '" . $transaction_id . "',
								from_store_id = '" . $ao_fromstore_id . "',
								from_store_name = '" . $ao_fromstore_name . "',
								to_store_id = '" . $ao_tostore_id . "',
								to_store_name = '" . $ao_tostore_name . "',
								item_id = '" . $outward_items['item_id'] . "',
								quantity = '" . $outward_items['quantity'] . "',
								received_quantity = '" . $outward_items['received_quantity'] . "',
								transaction_date = '" . $ao_transactiontime . "',
								user_id = '" . $ao_user_id . "'";
								
		$ao_rec= $db->qry($ins_ao_register);
		
		$get_fromstock_reg = $db->qry("SELECT quantity FROM asset_stock_register WHERE store_id = '" . $ao_fromstore_id . "' AND item_id = '" . $outward_items['item_id'] . "'");
		
		$from_quantity = $get_fromstock_reg[0]['quantity'];
		$from_quantity -= $outward_items['received_quantity'];
		
		$update_from_store= $db->qry("UPDATE asset_stock_register SET quantity = '" . $from_quantity . "' WHERE store_id = '" . $ao_fromstore_id . "' AND item_id = '" . $outward_items['item_id'] . "'");
		
		$stock_count = $db->count('asset_stock_id', 'asset_stock_register', 'WHERE store_id = "' . $ao_tostore_id . '" AND item_id = "' . $outward_items['item_id'] . '"');
            
		if ($stock_count > 0) {
			
			$get_tostock_reg = $db->qry("SELECT quantity FROM asset_stock_register WHERE store_id = '" . $ao_tostore_id . "' AND item_id = '" . $outward_items['item_id'] . "'");
		
			$to_quantity = $get_tostock_reg[0]['quantity'];
			$to_quantity += $outward_items['received_quantity'];
			
			$update_tostock = $db->qry("UPDATE asset_stock_register SET quantity = '" . $to_quantity . "' WHERE store_id = '" . $ao_tostore_id . "' AND item_id = '" . $outward_items['item_id'] . "'");
			
		} else {
			
			$insert_tostock_reg = $db->qry("INSERT INTO asset_stock_register SET 
											store_id = '" . $ao_tostore_id . "',
											item_id = '" . $outward_items['item_id'] . "',
											quantity = '" . $outward_items['received_quantity'] . "'");
		}
	}
	
	echo json_encode($ao_rec);
}
?>