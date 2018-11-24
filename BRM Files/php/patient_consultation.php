<?php
include_once ("dbclass.php");
$db=new db();


if($_GET['action']=='all')
{
	$rec=$db->qry("select * from patient_consultation");
	
	echo json_encode($rec);
}


?>