<?php
include_once("dbclass.php");
$db=new db();

if($_GET['specialities']=='all'){
	//retrieving the specialities data
	$res=$db->qry("select * from specialities ");
  	echo json_encode($res);
  } 
if($_GET['specialities']=='yes'){
	//getting the specialities with specific id
	$get_rec=$db->qry("select * from specialities where spid=".$_GET['sp_id']);
	echo json_encode($get_rec);
}
if($_GET['act']=='add'){
	//inserting the data into specialities
extract($_POST);
	$add_rec=$db->qry("insert into specialities (spname,spdesc) values ('$spname','$spdesc')");
	echo json_encode($add_rec);
}
if($_GET['act']=='up'){
	//updating the data
extract($_POST);
//print_r($_POST);
  $inserr=$get_rec=$db->qry("update specialities set spname='$spname',spdesc='$spdesc' where spid='$spid'");
}

if($_GET['act']=='del'){
	//delete the data
	if($_GET['status']==1){ $stat=0;}else{ $stat=1; }
    $db->qry("update specialities set status=$stat where spid=".$_GET['delete_spid']);
     echo "Speciality deleted Successfully!";
}
?>