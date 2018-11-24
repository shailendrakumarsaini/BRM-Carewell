<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action']=='all') {
    //Get all assets details.

	$rec=$db->qry("select * from assets as a join item_group as i on a.asset_group_id = i.ig_id join inventory_units as iu on a.asset_units = iu.unit_id join tax_master as t on a.asset_tax = t.tax_id");
	
	echo json_encode($rec);
}

if($_GET['action']=='items') {
    //Get item group details.
	$org_rec=$db->qry("select * from item_group ");
	echo json_encode($org_rec);
}

if($_GET['action']=='assets_list') {
    //Get assets list.

	$org_rec=$db->qry("select * from assets as a join item_group as i on a.asset_group_id = i.ig_id and i.is_medicine = 'N' join tax_master as t on a.asset_tax=t.tax_id AND asset_status = 1");
	echo json_encode($org_rec,true);
}

if($_GET['action'] == 'store')
{
	$store=$db->qry("SELECT * FROM store");
	echo json_encode($store);
}


if($_GET['action']=='units') {
    //Get units data.

	$inv_res=$db->qry("select * from inventory_units where status=1");
	echo json_encode($inv_res);
}
if($_GET['action']=='taxes') {
    //Get tax details.

	$tax_rec=$db->qry("select * from tax_master");
	echo json_encode($tax_rec);	
}

if($_GET['action']=='add') {
    //Add new asset.

	extract($_POST);
	$query="insert into assets(asset_name,asset_group_id,asset_brand,asset_desc,asset_units,asset_tax) values ('$asset_name','$asset_group_id','$asset_brand','$asset_desc','$asset_units','$asset_tax')";
	$add_res=$db->qry($query);
	echo json_encode($add_res);
}

if($_GET['action']=='update') {
    //Update asset data.

	extract($_POST);
	$query="update assets set asset_name='$asset_name',asset_group_id='$asset_group_id',asset_brand='$asset_brand',asset_desc='$asset_desc',asset_units='$asset_units',asset_tax='$asset_tax' where asset_id='$asset_id'";
	$update=$db->qry($query);
	echo("updated successfully");
}
if($_GET['action']=='delete') {
    //Delete asset data.

    $db->qry("delete from assets where asset_id=".$_GET['asset_id']);
    echo " deleted Successfully!";
}

if($_GET['action']=='update_status' and $_GET['assets_id']!=null) {
    //Change status of asset.
	$q=$db->qry("select * from assets where asset_id=".$_GET['assets_id']);
	if($q[0]['asset_status']==1){
		$query="update assets set asset_status=0 where asset_id=".$_GET['assets_id'];
	}
	else{
		$query="update assets set asset_status=1 where asset_id=".$_GET['assets_id'];
	}
	$update=$db->qry($query);
	if($update){
		echo("updated successfully");
	}
}

?>
