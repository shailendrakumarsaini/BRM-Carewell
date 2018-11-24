<?php
include_once("dbclass.php");
$db=new db();
if($_GET['year']=='all')
	echo json_encode($db->qry("select * from year_master"));

if($_GET['user_branch']>0)
	echo json_encode($db->qry("select * from branch join user_branch on bid=branch_id join institute_group on ig_id=ins_cat_id where user_id=".$_GET['user_branch']." order by ig_id,bid"));


?>