<?php
include_once ("dbclass.php");
$db=new db();
if($_GET['action'] === 'all') {
    //retrieving the medical purchase order
    
	$rec = $db->qry("SELECT * FROM medicines_pos AS m JOIN supplier AS s ON s.id = m.medicinepo_supplier_id ORDER BY m.medicinepo_id DESC");
	echo json_encode($rec);
}

if($_GET['action'] === 'supplier') {
    //getting the name of supplier when supply_status is one
    
	$rec = $db->qry("select id,name from supplier where supply_status = 1");
	echo json_encode($rec);
}

if($_GET['action'] === 'medicine_pod' and $_GET['medicine_po_id'] !== '') {
    //getting the medicine purchase order data with particular purchase order id
    
    $rec = $db->qry("SELECT mpd.*, mp.*, m.med_name FROM medicines_podata AS mpd JOIN medicines_pos AS mp ON mpd.medicine_po_id = mp.medicinepo_id JOIN medicines AS m ON m.med_id = mpd.mpo_item_id WHERE mpd.medicine_po_id = " . $_GET['medicine_po_id']);
    
	echo json_encode($rec);
}

if($_GET['action'] === 'medicine_pod_for_print' AND $_GET['medicine_po_id'] !== '') {
	//getting the medicine purchase order data with particular purchase order id
	
	$medicine_po_details = array();
	
	$rec = $db->qry("SELECT mpd.*, m.med_name, t.tax_name, t.tax_percent FROM medicines_podata AS mpd JOIN medicines AS m ON m.med_id = mpd.mpo_item_id JOIN tax_master AS t ON t.tax_id = mpd.tax WHERE mpd.medicine_po_id = " . $_GET['medicine_po_id']);
    $medicine_po_details['mpo_details'] = $rec;
    
	$getHospitalDetails = $db->qry("SELECT hid, hname, haddress FROM hospitals WHERE hid = 1");
	$medicine_po_details['hospitalDetails'] = $getHospitalDetails[0];
    
    $getSupplierDetails = $db->qry("SELECT su.name, mpo.medicinepo_id, mpo.medicinepo_date FROM medicines_pos AS mpo JOIN supplier AS su ON su.id = mpo.medicinepo_supplier_id WHERE mpo.medicinepo_id = " . $_GET['medicine_po_id']);
    $medicine_po_details['mpoInfo'] = $getSupplierDetails[0];
    
	echo json_encode($medicine_po_details);
}

if($_GET['action']=='get_med_pod_if_not_rec' and $_GET['medicine_po_id'] !== '') {
	
    $rec = $db->qry("SELECT mpd.*, mp.*, m.med_name, m.med_boxpack, t.tax_name, t.tax_percent FROM medicines_podata AS mpd JOIN medicines_pos AS mp ON mpd.medicine_po_id = mp.medicinepo_id JOIN medicines AS m ON m.med_id = mpd.mpo_item_id JOIN tax_master AS t ON t.tax_id = mpd.tax WHERE mpd.medicine_po_id = '".$_GET['medicine_po_id']."' AND mpd.mpo_qty <> mpd.mpo_qty_received");
    
	echo json_encode($rec);
}

if($_GET['action'] === 'item_latest_po' && $_GET['item_id'] !== '') {
	
    $rec = $db->qry("SELECT mpod.*, t.tax_id, t.tax_name, t.tax_percent FROM medicines_podata AS mpod JOIN tax_master AS t ON t.tax_id = mpod.tax WHERE mpod.mpo_item_id = '" . $_GET['item_id'] . "' ORDER BY mpod.medicine_po_id DESC LIMIT 0, 1");
    
	echo json_encode($rec);
}

if ($_GET['action'] == "add") {
	
	extract($_POST);
    //print_r($_POST);
    
    $medicinepo_date = date("Y-m-d", strtotime($medicine_pos['medicinepo_date']));
	$medicinepo_supplier_id = $medicine_pos['medicinepo_supplier_id'];
	$medicinepo_authorised_by = $medicine_pos['medicinepo_authorised_by'];
	$medicinepo_price = $medicine_pos['total_amount'];
	$medicinepo_discount = $medicine_pos['discount'];
	$medicinepo_net_price = $medicine_pos['net_amount'];
	
	$in_asset_po = $db->qry("INSERT INTO medicines_pos SET 
                                medicinepo_date = '" . $medicinepo_date . "',
                                medicinepo_supplier_id = '" . $medicinepo_supplier_id . "',
                                medicinepo_authorised_by = '" . $medicinepo_authorised_by . "',
                                medicinepo_price = '" . $medicinepo_price . "',
                                medicinepo_discount = '" . $medicinepo_discount . "',
                                medicinepo_net_price = '" . $medicinepo_net_price . "'");
	
	$po_id = $db->id();
 
	foreach ($medicine_pos['items_list'] as $medicinepos_data) {
		
		$get_medicine_name_array = $db->qry("SELECT med_name FROM medicines WHERE med_id = '" . $medicinepos_data['mpo_item_id'] . "'");
		
		$get_medicine_name = $get_medicine_name_array[0];
		
		$ins_medicine_podata="INSERT INTO medicines_podata SET 
								mpo_item_id = '" . $medicinepos_data['mpo_item_id'] . "',
								mpo_qty = '" . $medicinepos_data['mpo_qty'] . "',
								mpo_mrp = '" . $medicinepos_data['mpo_mrp'] . "', 
								mpo_pp = '" . $medicinepos_data['mpo_pp'] . "', 
								medicine_po_id = '" . $po_id . "', 
								tax = '" . $medicinepos_data['mpo_tax_id'] . "'";
		
		echo $pos_rec = $db->qry($ins_medicine_podata);
	}

	echo json_encode($in_asset_po);
}

/*update query */

if ($_GET['action'] == "update" AND $_GET['medicinepo_id'] !== '') {
	
	extract($_POST);
	
	$medicinepo_date = date("Y-m-d", strtotime($medicine_pos['medicinepo_date']));
	$medicinepo_supplier_id = $medicine_pos['medicinepo_supplier_id'];
	$medicinepo_authorised_by = $medicine_pos['medicinepo_authorised_by'];
	$medicinepo_price = $medicine_pos['total_amount'];
	$medicinepo_net_price = $medicine_pos['net_amount'];
    
	$ins_medicine_po = "UPDATE  medicines_pos SET 
						medicinepo_date = '" . $medicinepo_date . "',
						medicinepo_supplier_id = '" . $medicinepo_supplier_id . "',
						medicinepo_authorised_by = '" . $medicinepo_authorised_by . "',
						medicinepo_price = '" . $medicinepo_price . "',
						medicinepo_net_price = '" . $medicinepo_net_price . "' WHERE medicinepo_id = '" . $_GET['medicinepo_id'] . "'";
 
	$db->qry($ins_medicine_po);
	$po_id=$db->id();
	
	$delete_item_qry = "DELETE FROM medicines_podata WHERE medicine_po_id = '" . $po_id . "'";
	
	foreach ($medicine_pos['items_list'] as $medicinepos_data) {
		
		$get_medicine_name_array = $db->qry("SELECT med_name FROM medicines WHERE med_id = '" . $medicinepos_data['mpo_item_id'] . "'");
		
		$get_medicine_name = $get_medicine_name_array[0];
		
		$ins_medicine_podata = "INSERT INTO medicines_podata SET 
								mpo_item_id = '" . $medicinepos_data['mpo_item_id'] . "', 
								mpo_item_name = '" . $get_medicine_name['med_name'] . "', 
								mpo_qty = '" . $medicinepos_data['mpo_qty'] . "', 
								mpo_mrp = '" . $medicinepos_data['mpo_mrp'] . "', 
								mpo_pp = '" . $medicinepos_data['mpo_pp'] . "', 
								medicine_po_id = '" . $po_id . "', 
								tax = '" . $medicinepos_data['tax'] . "'";
		
		$pos_rec = $db->qry($ins_medicine_podata);
	}

	echo json_encode($pos_rec);
}

?>