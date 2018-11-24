<?php
include_once("dbclass.php");
$db=new db();

if($_GET['act']=='all'){
	//get all the inventory_units
	$res=$db->qry("select * from inventory_units ");
	echo json_encode($res);
  }
if($_GET['action']=='only_medicals'){
	//units with only_medicals
	$rec=$db->qry("select * from inventory_units where is_medicine='Y'");
	echo json_encode($rec);
}
if($_GET['act']=='addinvent'){
	//add inventory_units data
	extract($_POST);
	$add_rec=$db->qry("insert into inventory_units (unit_name) values ('$unit_name')");
	echo json_encode($add_rec);
  }
if($_GET['inve_unit']=='yes'){
	$get_rec=$db->qry("select * from inventory_units where  unit_id=".$_GET['unit_id']);
	echo json_encode($get_rec);
  }
if($_GET['act']=='up'){
	//update inventory_units data
extract($_POST);
//print_r($_POST);
  $update=$get_rec=$db->qry("update inventory_units set unit_name='$unit_nmae' where unit_id='$unit_id'");
}
if($_GET['act']=='del'){
	//delete inventory_units data
    $db->qry("delete from inventory_units where unit_id=".$_GET['unit_id']);
     echo "Fecility deleted Successfully!";
}
if($_GET['act']=='st'){
	//changing the status of inventory_units
    $db->qry("update inventory_units set status=".$_GET['status']." where unit_id=".$_GET['unit_id']);
      echo "Status Change Successfully!";
}

?>