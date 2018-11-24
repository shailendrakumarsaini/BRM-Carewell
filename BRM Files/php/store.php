<?php

include_once("dbclass.php");
$db=new db();

if($_GET['action']==='all'){
	//retrieving the store data
	$rec=$db->qry("select * from store join locations on store.location_id = locations.loc_id");
	echo json_encode($rec);
}

if($_GET['action']==='specific_store' AND $_GET['id']!==null) {
	//Getting the specific store data with particular id
	$rec=$db->qry("select * from store join locations on store.location_id=locations.loc_id AND store.id=".$_GET['id']);
	echo json_encode($rec);
}

if($_GET['action']=='location'){
	//getting the location details
	$db-qry("select lo.loc_id,lo.loc_name,lo.block_name,lo.loc_code,s.id FROM store AS s JOIN locations AS lo ON s.location_id=lo.loc_id ");
}

if($_GET['action']== 'super_store'){
	//getting the super store details
	$super_store_data=$db->qry("SELECT * FROM store WHERE is_super_store='yes' AND store_status= 1");
	echo json_encode($super_store_data);
}
/*if($_GET['action']=='active')
{
	$rec=$db->qry("select * from store where status=1");
	echo json_encode($rec);
}*/

if($_GET['action']=='organization'){
	//getting the organization details
	$org_rec=$db->qry("select hid,hcode,hname from hospitals");
	echo json_encode($org_rec);
	
}	
if($_GET['action']=='add'){
	// inserting the data
    extract($_POST);
    if ($store_account_group === '') {

        $store_account_group = "NULL";
    }

    // if ($tin_no === '') {

    //     $tin_no = "NULL";
    // }

    // if ($drug_no === '') {

    //     $drug_no = "NULL";
    // }

	$query="insert into store(store_type,store_name,store_account_group,tin_no,drug_no,is_super_store,sales_unit,location_id) values ('$store_type','$store_name',$store_account_group,'$tin_no','$drug_no','$is_super_store','$sales_unit','$location_id')";
	
	
    $add_res=$db->qry($query);
	echo json_encode($add_res);
}
if($_GET['action']=='update'){
	//updating the data
	extract($_POST);
	
	if ($store_account_group === '') {

        $store_account_group = "NULL";
    }
	
	
	$query="update store set store_type='$store_type',store_name='$store_name',store_account_group=$store_account_group,tin_no='$tin_no',drug_no='$drug_no',is_super_store='$is_super_store',sales_unit='$sales_unit',location_id='$location_id' where id='$id' ";
	$update=$db->qry($query);
	
	echo("updated successfully");
}
if($_GET['action']=='delete'){
	//delete the data
    $db->qry("delete from store where id=".$_GET['id']);
    echo " deleted Successfully!";
}

if($_GET['action']="update_status" and $_GET['store_id']!=null){
	//changing the store status
		$q=$db->qry("select store_status from store where id=".$_GET['store_id']);
		
		if($q[0]['store_status']==1)
				$query="update store set store_status=0 where id=".$_GET['store_id'];
			else
				$query="update store set store_status=1 where id=".$_GET['store_id'];
			
		$update=$db->qry($query);
		if($update)
		{
			echo "updated successfully";
		}
}
?>
