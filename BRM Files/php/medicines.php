<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action'] == 'all'){
	//retrieving the medicines data 
	$rec = $db->qry("SELECT m.med_id, m.med_group_id, m.med_category, m.med_name, m.med_brand, m.med_combination, m.med_allow_sale,m.med_sale_units, m.med_distributed_units, m.med_tax, m.med_status, m.med_reorder, m.med_code, m.med_hsncode,m.	med_manufacturedby,m.med_schedule, m.med_purchasepack, m.med_no_of_units, m.med_boxpack, m.med_rockno, i.ig_id, i.ig_name, t.tax_name, t.tax_percent FROM medicines AS m JOIN item_group AS i ON m.med_group_id = i.ig_id JOIN tax_master AS t ON t.tax_id = m.med_tax");

echo json_encode($rec);
}
if($_GET['action'] == 'only_medicals') {
	//getting only medicine from the item group
	$rec=$db->qry("SELECT * FROM item_group WHERE is_medicine='Y' AND ig_asset='N'");
	echo json_encode($rec);
}

if($_GET['action'] == 'add'){
	
	// Inserting the medicine data
	
	extract($_POST);
	//print_r($_POST);
	$query="INSERT INTO medicines(med_group_id,med_category,med_name,med_brand,med_combination,med_allow_sale,med_sale_units,med_distributed_units,med_tax,med_reorder,med_code,med_hsncode,med_manufacturedby,med_schedule,med_purchasepack,med_no_of_units,med_boxpack,med_rockno) VALUES ('$med_group_id','$med_category','$med_name','$med_brand','$med_combination','$med_allow_sale','$med_sale_units','$med_distributed_units','$med_tax','$med_reorder','$med_code','$med_hsncode','$med_manufacturedby','$med_schedule','$med_purchasepack','$med_no_of_units','$med_boxpack','$med_rockno')";
	//echo $query;
	$add_res=$db->qry($query);
	echo json_encode($add_res);
}
if($_GET['action'] == 'update'){
	
	//updating the medicine
	
	extract($_POST);
	$query="UPDATE medicines SET med_group_id='$med_group_id',med_category='$med_category',med_name='$med_name',med_brand='$med_brand',med_combination='$med_combination',med_allow_sale='$med_allow_sale',med_sale_units='$med_sale_units',med_distributed_units='$med_distributed_units',med_tax='$med_tax',med_reorder='$med_reorder', med_code= '$med_code', med_hsncode='$med_hsncode',med_manufacturedby='$med_manufacturedby',med_schedule='$med_schedule',med_purchasepack='$med_purchasepack',med_no_of_units='$med_no_of_units',med_boxpack='$med_boxpack',med_rockno='$med_rockno' WHERE med_id='$med_id'";
	//echo $query;
	$update=$db->qry($query);
	echo("updated successfully");
}
if($_GET['action'] == 'delete'){
	//deleting the medicine
    $db->qry("DELETE FROM medicines WHERE med_id=".$_GET['medi_id']);
    echo " deleted Successfully!";
}

if($_GET['action'] == 'update_status' and $_GET['medic_id']!= null){
	
	//changing the status of the medicine
	
	$q=$db->qry("SELECT * FROM medicines WHERE med_id=".$_GET['medic_id']);
	
	if($q[0]['med_status']==1){
		 $query="UPDATE medicines SET med_status=0 WHERE med_id=".$_GET['medic_id'];
	}else{
		$query="UPDATE medicines SET med_status=1 WHERE med_id=".$_GET['medic_id'];
	}
	$update=$db->qry($query);
	
	if($update){
		echo("updated successfully");
	}
}
?>
