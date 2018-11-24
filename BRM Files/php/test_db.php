<?php
//echo $_GET['email'];
include_once("dbclass.php");
$db=new db();
if(isset($_POST['samples'])) {
    
    extract($_POST);
	$res = $db->qry("INSERT INTO test_data(test_data) VALUES('" . json_encode($samples['values']) . "')");
	echo json_encode($res);
}

?>
