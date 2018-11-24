<?php

include_once("dbclass.php");
$db=new db();

if($_GET['action']=='all'){
	//retrieving the supplier data
	
	$rec=$db->qry("select * from supplier");
	echo json_encode($rec);
}		
if($_GET['action']=='add'){
	//inserting the data
	
	extract($_POST);
	$query="insert into supplier(name,address,city,contact_person,mobile,gst_no,tin_no,category) values ('$name','$address','$city','$contact_person','$mobile','$gst_no','$tin_no','$category')";
	//echo $query;
	$add_res=$db->qry($query);
	echo json_encode($add_res);
}
if($_GET['action']=='update'){
	//update the data
	
	extract($_POST);
	//print_r ($_POST);
	$query="update supplier set name='$name',address='$address',city='$city',contact_person='$contact_person',mobile='$mobile',gst_no='$gst_no',tin_no='$tin_no',category='$category' where id='$id' ";
	//echo $query;
	$update=$db->qry($query);
	echo("updated successfully");
}
if($_GET['action']=='delete'){
	//delete the data
	
    $db->qry("delete from supplier where id=".$_GET['id']);
    echo " deleted Successfully!";
}
if($_GET['action']=='update_status' and $_GET['supplier_id']!=null){
	//changing the status of the supplier
	
	$q=$db->qry("select * from supplier where id=".$_GET['supplier_id']);
	if($q[0]['supply_status']==1){
		$query="update supplier set supply_status=0 where id=".$_GET['supplier_id'];
	}else{
		$query="update supplier set supply_status=1 where id=".$_GET['supplier_id'];
	}
	$update=$db->qry($query);
	if($update){
		echo("updated successfully");
	}
}
?>