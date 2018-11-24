<?php
include_once("dbclass.php");
$db=new db();

  if($_GET['act'] == 'all'){
	$res=$db->qry("select * from inventory_inward");
	echo json_encode($res);
  }
  
  
  if($_GET['act'] == 'add'){
	extract($_POST);
	$invetory = $_POST['invetory'];
	for($i=0; $i<count($listinfo); $i++)
	{
		
		$getselect=$db->qry("select * from inventory_qty where item_id='".$listinfo[$i]['item_id']."'");
		  echo   $qtest=is_array($getselect); 
		  $totalqty=$listinfo[$i]['qty']+$getselect[0]['total_qty'];  
		if($qtest=='1')
		{
		 
			$db->qry("update inventory_qty  set total_qty=$totalqty where 	item_id='".$getselect[0]['item_id']."'");
		  
		}else{
			
			$db->qry("insert into inventory_qty  (item_id,total_qty) values ('".$listinfo[$i]['item_id']."','".$totalqty."')");
		}
		$pat = "/(?:Sun|Mon|Tue|Wed|Thu|Fri|Sat) (?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (?:0?[1-9]|[1-2][0-9]|3[0-1]) [0-9]{4} [0-9]{2}:[0-9]{2}:[0-9]{2} GMT\\+[0-9]{4}/";
		$purchase_date = preg_match($pat, $invetory['date_of_purchase'], $mat) ? date("Y-m-d", strtotime($mat[0])) : "";
		$res=$db->qry("insert into inventory_inward (item_id,item_name,item_group,is_medicine,item_units,qty,vendor,receipt_no,mrp,purchase_price,date_of_purchase) values ('".$listinfo[$i]['item_id']."','".$listinfo[$i]['item_name']."','".$listinfo[$i]['item_group']."','".$listinfo[$i]['is_medicine']."','".$listinfo[$i]['unitname']."','".$listinfo[$i]['qty']."','".$invetory['vendor']."','".$invetory['invoiceno']."','".$listinfo[$i]['mrp']."','".$listinfo[$i]['purchase_price']."','".$purchase_date."')");
		
	} 
	echo json_encode($add_rec);	
  }
  
   if($_GET['action']=='itmesdata'){
	  if($_GET['itm']=='undefined' || $_GET['itm']==''){
		  $scond="IS NOT NULL";
		  }
		  else{
			  $scond="LIKE '%".$_GET['itm']."%'"; 
			  }
	$res=$db->qry("select item_name  from items   where 	item_name  ".$scond." or  item_code  ".$scond." group by 	item_name  limit 5");
    echo json_encode($res);
  }
  
  if($_GET['action']=='getunit'){
	  
	  $scond="LIKE '".$_GET['itm']."'"; 
	  
	  $res=$db->qry("select * from items where item_name = ".$scond."");
	  
	  $unts=$db->qry("select * from inventory_units    where unit_id = ".$res[0]['item_units']."");
	  
	 $pricedate=$db->qry("select purchase_price,qty from inventory_inward    where 	item_id ='".$res[0]['item_id']."' order by inward_id desc limit 1 ");
	      
		       $price=$pricedate[0]['purchase_price'];
			   $qty=$pricedate[0]['qty'];
		 
	  $data[] = array(
	  			 "item_id"=>$res[0]['item_id'],			
	  			 "item_name"=>$res[0]['item_name'],
				 "item_group"=>$res[0]['item_group'],
				 "is_medicine"=>$res[0]['is_medicine'],				
				 "unitname"=>$unts[0]['unit_name'],
				 "purchase_price"=>intval($price),
				"qty"=>$qty,				 
				 "manifacturer"=>$res[0]['item_manufacturer']
		 );	
	  
		 echo json_encode($data);
  }
  if($_GET['action']=='itmeunits'){
	  if($_GET['units']=='undefined'){
		  $scond="IS NOT NULL";
		  }
		  else{
			  $scond="LIKE '%".$_GET['units']."%'"; 
			  }
	$res=$db->qry("select unit_name from inventory_units  where unit_name  ".$scond." group by unit_name  limit 5");
    echo json_encode($res);
  }
  
   if($_GET['action']=='vname'){
	  if($_GET['vendorname']=='undefined'){
		  $scond="IS NOT NULL";
		  }
		  else{
			  $scond="LIKE '%".$_GET['vendorname']."%'"; 
			  }
	$res=$db->qry("select vendor from inventory_inward   where vendor  ".$scond." group by vendor  limit 5");
    echo json_encode($res);
  }
  
if($_GET['act']=='up'){
	extract($_POST);
	$data=$_POST['data']; 
	//print_r($_POST);
	//echo $item_expiry_date;exit;
	$pat = "/(?:Sun|Mon|Tue|Wed|Thu|Fri|Sat) (?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (?:0?[1-9]|[1-2][0-9]|3[0-1]) [0-9]{4} [0-9]{2}:[0-9]{2}:[0-9]{2} GMT\\+[0-9]{4}/";

$item_expiry_date = preg_match($pat, $item_expiry_date, $mat) ? date("Y-m-d", strtotime($mat[0])) : "";
$date_of_purchase = preg_match($pat, $date_of_purchase, $mat) ? date("Y-m-d", strtotime($mat[0])) : "";
$return_date = preg_match($pat, $return_date, $mat) ? date("Y-m-d", strtotime($mat[0])) : "";
$warrenty_date = preg_match($pat, $warrenty_date, $mat) ? date("Y-m-d", strtotime($mat[0])) : "";


	//$itm="LIKE '%".$invetory['item_name']."%'"; 
		//$res=$db->qry("select item_name,item_id,item_group,is_medicine from items where item_name  ".$scond."");
		
	$res=$db->qry ("update inventory_inward set item_batch_code='$item_batch_code',item_expiry_date='$item_expiry_date',item_brand_name='$item_brand_name',date_of_purchase='$date_of_purchase', sale_price='$sale_price',return_date='$return_date',warrenty_date='$warrenty_date' where inward_id=$inward_id");
	 
}

















?>