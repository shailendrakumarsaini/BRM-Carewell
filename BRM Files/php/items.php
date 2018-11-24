<?php
include_once("dbclass.php");
$db=new db();

  if($_GET['act']=='all'){
	$res=$db->qry("select * from items,inventory_units where item_units=unit_id");
	echo json_encode($res);
  }
  
 if($_GET['act']=='tax'){
	$res=$db->qry("select * from tax_master group by tax_percent");
	echo json_encode($res);
  }
 if($_GET['act']=='add'){
	extract($_POST);
	//print_r($_POST);exit;
	if($is_fixed_asset=='true'){
		$is_fixed_asset=1;
	}else
	{
		$is_fixed_asset=0;
	}
	if($is_deleted=='true'){
		$is_deleted=1;
	}else
	{
		$is_deleted=0;
	}
	if($is_medicine=='true'){
		$is_medicine=1;
	}else
	{
		$is_medicine=0;
	}
	if($in_house_use_only=='true'){
		$in_house_use_only=1;
	}else
	{
		$in_house_use_only=0;
	}
	if($is_consumable=='true'){
		$is_consumable=1;
	}else
	{
		$is_consumable=0;
	}
	
// $getcode = $db->qry("select item_code from items order by item_id desc limit 1");
// if(count($getcode)>0)
// {
// $tnumber = preg_replace("/[^-0-9]+/", '', $getcode[0]['item_code'])+1;
// }else{
 // $tnumber=1;
// }	
// $item_code = "ITEM".$tnumber;
	
	$add_rec=$db->qry("insert into items (item_code,item_group,item_name,item_units,item_manufacturer,is_fixed_asset,is_consumable,in_house_use_only,is_medicine,taxes,is_deleted,med_combination) values ('$item_code','$item_group','$item_name','$item_units','$item_manufacturer','$is_fixed_asset','$is_consumable','$in_house_use_only','$is_medicine','$taxes','$is_deleted','$med_combination')");
	echo json_encode($add_rec);
  }
  if($_GET['items']=='yes'){
	  $rec=$db->qry("Select * from items where item_id=".$_GET['item_id']."");
	  echo json_encode($rec);
  }
  if($_GET['act']=='up'){
	   extract($_POST);
	  //print_r($_POST);exit;
  if($is_fixed_asset=='true' || $is_fixed_asset=='1'){
		$is_fixed_asset='1';
	}else
	{
		$is_fixed_asset=0;
	}
	if($is_deleted=='true' || $is_deleted=='1'){
		$is_deleted=1;
	}else
	{
		$is_deleted=0;
	}
	if($is_medicine=='true' || $is_medicine=='1'){
		$is_medicine=1;
	}else
	{
		$is_medicine=0;
	}
	if($in_house_use_only=='true' || $in_house_use_only=='1'){
		$in_house_use_only=1;
	}else
	{
		$in_house_use_only=0;
	}
	if($is_consumable=='true' || $is_consumable=='1'){
		$is_consumable=1;
	}else
	{
		$is_consumable=0;
	}
	
	$db->qry("update items set item_code='$item_code',item_group='$item_group',item_name='$item_name',item_units='$item_units',item_manufacturer='$item_manufacturer',is_fixed_asset='$is_fixed_asset',is_consumable='$is_consumable',in_house_use_only='$in_house_use_only',is_medicine='$is_medicine',taxes='$taxes',is_deleted='$is_deleted',med_combination='$med_combination' where item_id=$item_id");
  }
  if($_GET['action']=='groups'){
	  if($_GET['sdata']=='undefined'){
		  $scond="IS NOT NULL";
		  }
		  else{
			  $scond="LIKE '".$_GET['sdata']."%'"; 
			  }
	$res=$db->qry("select item_group from items where item_group ".$scond." group by item_group limit 5");
    echo json_encode($res);
  }
  
    if($_GET['action']=='manif'){
	  if($_GET['manidata']=='undefined'){
		  $mcond="IS NOT NULL";
		  }
		  else{
			  $mcond="LIKE '".$_GET['manidata']."%'"; 
			  }
	$res=$db->qry("select item_manufacturer from items where item_manufacturer ".$mcond." group by item_manufacturer limit 5");
    echo json_encode($res);
  }
  
  if($_GET['action']=='combina'){
	  if($_GET['combidata']=='undefined'){
		  $mcond="IS NOT NULL";
		  }
		  else{
			  $mcond="LIKE '".$_GET['combidata']."%'"; 
			  }
	$res=$db->qry("select med_combination from items where med_combination ".$mcond." group by med_combination limit 5");
    echo json_encode($res);
	
  }
  if($_GET['act']=='del'){
	  $get=$db->qry("select is_deleted from items where item_id=".$_GET['item_id']);
	    $res=$get[0]['is_deleted']; 
		if($res=='1')
		{
			$res=0;
		}else
		{
			$res=1;
		}
    $db->qry("update  items set is_deleted=$res where item_id=".$_GET['item_id']);
      echo "Item deleted Successfully!";
}
  
  
  
 if($_GET['act']=='st'){
	 
    $db->qry("update  items set is_deleted=".$_GET['status']." where item_id=".$_GET['item_id']);
      echo "Item deleted Successfully!";
} 
  
  
  
  
  
  
  
  ?>