<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action']=='all') {
	//retrieving the stock data
	$rec= $db->qry("SELECT msr.quantity, msr.batch_no, msr.expiry_date, i.ig_name, mi.med_name, s.store_name FROM medicine_stock_register AS msr JOIN medicines AS mi ON msr.item_id = mi.med_id JOIN item_group AS i ON mi.med_group_id =i.ig_id JOIN store as s ON msr.store_id = s.id ORDER BY msr.store_id ASC");
	
	echo json_encode($rec);
}

if($_GET['action'] === 'get_medicines_stock_list' && $_GET['search_string'] !== null) {
	
	//getting the medicine stock list

    $res = $db->qry("SELECT msr.medicine_stock_id, m.med_id, m.med_name, s.id AS store_id, s.store_name, m.med_distributed_units, m.med_sale_units, msr.quantity, msr.batch_no, msr.expiry_date, mir.medicinepo_id, IFNULL(mp.mpo_mrp , mir.mrp) AS price, IFNULL(mp.mpo_pp , mir.purchase_price) AS purchase_price, t.tax_name, t.tax_percent FROM medicine_stock_register AS msr JOIN medicines AS m ON m.med_id = msr.item_id JOIN store as s ON msr.store_id = s.id AND s.sales_unit = 'Yes' LEFT JOIN medicine_inward_register AS mir ON mir.item_id= msr.item_id AND mir.batch_no = msr.batch_no AND mir.expiry_date = msr.expiry_date LEFT JOIN medicines_podata AS mp ON mp.medicine_po_id = mir.medicinepo_id AND mp.mpo_item_id = mir.item_id JOIN tax_master AS t ON t.tax_id = m.med_tax WHERE m.med_name LIKE('%" . $_GET['search_string'] . "%') AND msr.expiry_date >= CURDATE() AND msr.quantity > 0 GROUP BY msr.item_id, msr.batch_no, msr.expiry_date ORDER BY msr.expiry_date LIMIT 0, 10");

    echo json_encode($res);
}

if($_GET['action'] === 'get_medicines_stock_list_from_dpo' && $_GET['search_string'] !== null) {
	

    $res = $db->qry("SELECT msr.medicine_stock_id, m.med_id, m.med_name, t.tax_name, t.tax_percent, s.id AS store_id, s.store_name, m.med_distributed_units, m.med_sale_units, msr.quantity, msr.batch_no, msr.expiry_date, dpod.mrp AS price, dpod.purchasePrice AS purchase_price FROM medicine_stock_register AS msr LEFT JOIN medicines AS m ON m.med_id = msr.item_id AND m.med_allow_sale = 'Yes' JOIN store as s ON msr.store_id = s.id AND s.sales_unit = 'Yes' LEFT JOIN DirectPODetails AS dpod ON dpod.medicineId = msr.item_id AND dpod.batchNo = msr.batch_no AND dpod.expiryDate = msr.expiry_date JOIN tax_master AS t ON t.tax_id = m.med_tax WHERE (m.med_name LIKE '%" . $_GET['search_string'] . "%' ) AND msr.expiry_date >= CURDATE() AND msr.quantity > 0 GROUP BY msr.item_id, msr.batch_no, msr.expiry_date ORDER BY msr.expiry_date");

    echo json_encode($res);
}

if($_GET['action'] === 'get_instock_medicines') {
	//getting the instock medicines
	
    //$get_pharmacy_store_name = $db->qry("SELECT store_id FROM store WHERE store_type = 'Inventory'");
    $res = $db->qry("SELECT DISTINCT m.med_id, m.med_name FROM medicine_stock_register AS msr JOIN medicines AS m ON m.med_id = msr.item_id JOIN store as s ON msr.store_id = s.id AND s.store_type = 'Inventory'");
    echo json_encode($res);
}

if($_GET['action'] === 'getStockOfStoreIfNotEmpty' AND $_GET['store_id'] !== null AND $_GET['search_string'] !== null) {
    
    //getting the medicine stock list of store

    $res = $db->qry("SELECT msr.medicine_stock_id, m.med_id, m.med_name, s.id AS store_id, s.store_name, m.med_distributed_units, m.med_sale_units, msr.quantity, msr.batch_no, msr.expiry_date, mir.medicinepo_id, IFNULL(mp.mpo_mrp , mir.mrp) AS price, IFNULL(mp.mpo_pp, mir.purchase_price) AS purchase_price, t.tax_name, t.tax_percent FROM medicine_stock_register AS msr JOIN medicines AS m ON m.med_id = msr.item_id JOIN store as s ON msr.store_id = s.id AND s.sales_unit = 'Yes' LEFT JOIN medicine_inward_register AS mir ON mir.item_id= msr.item_id AND mir.batch_no = msr.batch_no AND mir.expiry_date = msr.expiry_date LEFT JOIN medicines_podata AS mp ON mp.medicine_po_id = mir.medicinepo_id AND mp.mpo_item_id = mir.item_id JOIN tax_master AS t ON t.tax_id = m.med_tax WHERE msr.store_id = " . $_GET['store_id'] . " AND m.med_name LIKE('%" . $_GET['search_string'] . "%') AND msr.expiry_date >= CURDATE() AND msr.quantity > 0 GROUP BY msr.item_id, msr.batch_no, msr.expiry_date ORDER BY msr.expiry_date LIMIT 0, 10");

    echo json_encode($res); 	
}


if($_GET['action'] === 'specific_store' AND $_GET['store_id'] !== '' ) {
	
	$rec= $db->qry("SELECT msr.*, m.med_name FROM medicine_stock_register AS msr JOIN medicines AS m ON m.med_id = msr.item_id WHERE msr.store_id = '" . $_GET['store_id'] . "'");
	echo json_encode($rec);
}


if($_GET['action']=='specific_store_outward' AND $_GET['store_id'] !== '' ) {
	//getting the specific store outward details
	$rec= $db->qry("SELECT msr.*, m.med_name, m.med_reorder, s.store_name FROM medicine_stock_register AS msr join medicines AS m ON m.med_id = msr.item_id JOIN store AS s ON s.id = msr.store_id WHERE msr.store_id = '" . $_GET['store_id'] . "' AND msr.quantity > 0");	
	
	echo json_encode($rec);
}

if($_GET['action']=='stock_details' AND $_GET['store_id'] !== '' AND $_GET['item_id'] !== '') {
	//getting the stock details with specific store_id and item_id
	
	$rec= $db->qry("SELECT * FROM medicine_stock_register as msr join medicines as mi on mi.med_id=msr.item_id AND msr.store_id = '" . $_GET['store_id'] . "' AND msr.item_id= '" . $_GET['item_id'] . "' JOIN store as s ON msr.store_id = s.id");
	
	echo json_encode($rec);
}

?>