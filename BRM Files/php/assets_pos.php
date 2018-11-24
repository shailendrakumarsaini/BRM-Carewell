<?php
include_once ("dbclass.php");
$db=new db();
if($_GET['action']=='all') {
    //Get all asset pos data.
    
	$rec=$db->qry("SELECT * FROM assets_pos as a JOIN supplier ON supplier.id=assetpo_supplier_id ORDER BY a.assetpo_id  DESC");
	echo json_encode($rec);
}
if($_GET['action'] == 'supplier'){
	$rec=$db->qry("select id,name from supplier where supply_status = 1");
	echo json_encode($rec);
}

if($_GET['action']=='asset_pod' and $_GET['asset_po_id'] !== '') {
    //Get specific asset po details.
	$rec=$db->qry("SELECT * FROM assets_podata AS apd JOIN assets_pos AS ap ON apd.asset_po_id='".$_GET['asset_po_id']."' AND apd.asset_po_id = ap.assetpo_id");
	echo json_encode($rec);
}

if($_GET['action']=='get_pod_if_not_rec' and $_GET['asset_po_id'] !== '') {
    //Get asset po details if not received. 
	$rec=$db->qry("SELECT * FROM assets_podata AS apd JOIN assets_pos AS ap ON apd.asset_po_id='".$_GET['asset_po_id']."' AND apd.asset_po_id = ap.assetpo_id AND apd.apo_qty <> apd.apo_qty_received");	
	echo json_encode($rec);
}

if($_GET['action'] === 'item_latest_po' && $_GET['item_id'] !== '') {
    //Get latest purchase order details of an item.
	$rec=$db->qry("SELECT * FROM assets_podata AS apod WHERE apod.apo_item_id = '" . $_GET['item_id'] . "' ORDER BY apod.asset_po_id DESC LIMIT 0, 1");
	echo json_encode($rec);
}
if ($_GET['action'] == "add") {
    //Add new asset po. 
	extract($_POST);
    $assetpo_date = date("Y-m-d", strtotime($asset_pos['assetpo_datee']));
    $assetpo_supplier_id = $asset_pos['assetpo_supplier_id'];
    $assetpo_authorised_by = $asset_pos['assetpo_authorised_by'];
	$assetpo_price = $asset_pos['total_amount'];
	$assetpo_net_price = $asset_pos['net_amount'];
	if ($assetpo_price === '') {
		
		$assetpo_price = 0;
	}
	
	$in_asset_po= "INSERT INTO  assets_pos SET 
						assetpo_date = '" . $assetpo_date . "',
						assetpo_supplier_id = '" . $assetpo_supplier_id . "',
						assetpo_authorised_by = '" . $assetpo_authorised_by . "',
						assetpo_price = '" . $assetpo_price . "',
						assetpo_net_price = '" . $assetpo_net_price . "'";

	$db->qry($in_asset_po);
	$po_id=$db->id();
	foreach ($asset_pos['items_list'] as $assetpos_data) {
		
		$get_asset_name_array = $db->qry("SELECT asset_name FROM assets WHERE asset_id = '" . $assetpos_data['apo_item_id'] . "'");
		
		$get_asset_name = $get_asset_name_array[0];
		
		$in_asset_podata="INSERT INTO assets_podata SET 
								apo_item_id = '" . $assetpos_data['apo_item_id'] . "', 
								apo_item_name = '" . $get_asset_name['asset_name'] . "', 
								apo_qty = '" . $assetpos_data['apo_qty'] . "', 
								apo_mrp = '" . $assetpos_data['apo_mrp'] . "', 
								apo_pp = '" . $assetpos_data['apo_pp'] . "', 
								asset_po_id = '" . $po_id . "', 
								tax = '" . $assetpos_data['tax'] . "'";
		
		$pos_rec=$db->qry($in_asset_podata);
	}

	echo json_encode($pos_rec);
}

if ($_GET['action'] == "update" AND $_GET['assetpo_id'] !== '') {
    //Update asset po data.
    
	extract($_POST);
	
	$date = $asset_pos['assetpo_date'];
    $assetpo_date = date("Y-m-d", strtotime($date));
	$assetpo_supplier_id = $asset_pos['assetpo_supplier_id'];
	$assetpo_price = $asset_pos['total_amount'];
	$assetpo_net_price = $asset_pos['net_amount'];
	
	if ($assetpo_price === '') {
		
		$asssetpo_price = 0;
	}
	
	
	$in_asset_po= "UPDATE  assets_pos SET 
						assetpo_date = '" . $assetpo_date . "',
						assetpo_supplier_id = '" . $assetpo_supplier_id . "',
						assetpo_authorised_by = '1',
						assetpo_price = '" . $assetpo_price . "',
                        assetpo_net_price = '" . $assetpo_net_price . "' WHERE assetpo_id = '" . $_GET['assetpo_id'] . "'";
                        
 
	$db->qry($in_asset_po);
	$po_id=$db->id();
	
	$delete_item_qry = "DELETE FROM assets_podata WHERE asset_po_id = '" . $po_id . "'";
	
	foreach ($asset_pos['items_list'] as $assetpos_data) {
		
		$get_asset_name_array = $db->qry("SELECT asset_name FROM assets WHERE asset_id = '" . $assetpos_data['apo_item_id'] . "'");
		
		$get_asset_name = $get_asset_name_array[0];
		
		$in_asset_podata="INSERT INTO assets_podata SET 
								apo_item_id = '" . $assetpos_data['apo_item_id'] . "', 
								apo_item_name = '" . $get_asset_name['asset_name'] . "', 
								apo_qty = '" . $assetpos_data['apo_qty'] . "', 
								apo_mrp = '" . $assetpos_data['apo_mrp'] . "', 
								apo_pp = '" . $assetpos_data['apo_pp'] . "', 
								asset_po_id = '" . $po_id . "', 
								tax = '" . $assetpos_data['tax'] . "'";
		
		$pos_rec=$db->qry($in_asset_podata);
	}

	echo json_encode($pos_rec);
}

?>