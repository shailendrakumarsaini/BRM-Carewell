<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action']=='all') {
    //Get all stock details.
    
	$rec=$db->qry("SELECT asr.quantity, i.ig_name, a.asset_name, s.store_name FROM asset_stock_register AS asr JOIN assets AS a ON asr.item_id = a.asset_id JOIN item_group AS i ON a.asset_group_id =i.ig_id JOIN store as s ON asr.store_id = s.id ORDER BY asr.store_id ASC");
	echo json_encode($rec);
}
/* if($_GET['action']=='specific_store' AND $_GET['store_id'] !== '' ) {
    //Get specific store stock details.
    
	$rec=$db->qry("SELECT asset_stock_register.*,assets.asset_name FROM asset_stock_register join assets on assets.asset_id=asset_stock_register.item_id AND asset_stock_register.store_id = '" . $_GET['store_id'] . "'");
	echo json_encode($rec);
} */

if($_GET['action']=='specific_store' AND $_GET['store_id'] !== '' ) {
	//getting the specific store details
	$rec= $db->qry("SELECT asr.*, a.asset_name,i.ig_name, s.store_name FROM asset_stock_register AS asr join assets AS a ON a.asset_id = asr.item_id JOIN item_group AS i ON a.asset_group_id =i.ig_id  JOIN store AS s ON s.id = asr.store_id WHERE asr.store_id = '" . $_GET['store_id'] . "'");	
	
	echo json_encode($rec);
}

if($_GET['action']=='outward_specific_store' AND $_GET['store_id'] !== '' ) {
    //Get specific store stock details.
    
	$rec=$db->qry("SELECT asr.*, a.asset_name, s.store_name FROM asset_stock_register AS asr JOIN assets AS a ON a.asset_id = asr.item_id JOIN store AS s ON s.id = asr.store_id WHERE asr.store_id = '" . $_GET['store_id'] . "' AND asr.quantity > 0");
	echo json_encode($rec);
}

if($_GET['action']=='stock_details' AND $_GET['store_id'] !== '' AND $_GET['item_id'] !== '') {
    //Get quantity of an item in a store.
	
	$rec=$db->qry("SELECT * FROM asset_stock_register as asr join assets as a on a.asset_id=asr.item_id AND asr.store_id = '" . $_GET['store_id'] . "' AND asr.item_id= '" . $_GET['item_id'] . "' JOIN store as s ON asr.store_id = s.id");
	echo json_encode($rec);
}
?>