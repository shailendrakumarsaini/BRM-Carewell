<?php
include_once("dbclass.php");
$db=new db();

if($_GET['action']=='all')
{
	$rec=$db->qry("select * from item_group");
	echo json_encode($rec);
}

if($_GET['action']=='all_except_medicals')
{
	$rec=$db->qry("select * from item_group where is_medicine='N' AND ig_status =1");
	echo json_encode($rec);
}

if($_GET['action']=='add')
{
	// $data=json_decode(file_get_contents('php://input'),true);
	//print_r ($_POST);
	//echo 'hi';
	extract($_POST);
	
	
	$add_rec=$db->qry("insert into item_group(ig_name,ig_asset,is_medicine) values ('$ig_name','$ig_asset','$is_medicine')");
	 echo json_encode($add_rec);
}

if($_GET['action']=='update')
{
	extract($_POST);
	$update=$db->qry("update item_group set ig_name='$ig_name',ig_asset='$ig_asset',is_medicine='$is_medicine' where ig_id='$ig_id' ");
	
	echo("updated successfully");
}

if($_GET['action']=='delete')
{
	$db->qry("delete from item_group where ig_id=".$_GET['ig_id'] );
	echo "deleted successfully";
}

if($_GET['action']=='update_status' and $_GET['item_group_id']!=null)
{
	$q=$db->qry("select ig_status from item_group where ig_id=".$_GET['item_group_id']);
	
	if($q[0]['ig_status']==1)
	{
		$query=("update item_group set ig_status=0 where ig_id=".$_GET['item_group_id']);
	}
	else
	{
		$query=("update item_group set ig_status=1 where ig_id=".$_GET['item_group_id']);
	}
	$update=$db->qry($query);
	
	if($update)
	{
		echo("updated successfully");
	}
}
?>
