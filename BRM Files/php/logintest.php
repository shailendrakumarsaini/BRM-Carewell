<?php
include_once ("dbclass.php");
$db=new db();
if($_GET['action']=='all') {
	
	$rec=$db->qry("SELECT * FROM user");
	echo json_encode($rec);
}
?>