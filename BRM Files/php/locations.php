<?php
include_once("dbclass.php");
$db=new db();

  if($_GET['action']=='all'){
	  //retrieving the location data
	$res=$db->qry("select * from locations JOIN hospitals ON locations.hosp_id = hospitals.hid LEFT JOIN fecilities_group ON locations.fcgid = fecilities_group.fcgid");
	echo json_encode($res);
  }
 
 if($_GET['action']=='select_loc'){
//selecting the loc_name from locations where the status is on
 $res=$db->qry("select loc_id, loc_name from locations where status=1");
	echo json_encode($res);
 }

 if($_GET['action']=='location')
{
	$loc=$db->qry("select lo.loc_id,lo.loc_name,lo.block_name,lo.loc_code,s.id FROM store AS s JOIN locations AS lo ON s.location_id=lo.loc_id ");
	echo json_encode($loc);
}

if($_GET['loc']=='yes'){
	 
	$get_rec=$db->qry("select * from locations where  loc_id=".$_GET['locid']);
	echo json_encode($get_rec);
  }

  if($_GET['act']=='updloc'){
	  //update the location
	extract($_POST);
   $update=$db->qry("update locations  set loc_code='$loc_code',block_name='$block_name',loc_name='$loc_name',hosp_id='$hosp_id', fcgid='$fcgid' where loc_id='$locid'");
}

if($_GET['act']=='add'){
	//inserting the data
	extract($_POST);
$getcode = $db->qry("select loc_code from locations order by loc_id desc limit 1");
if(gettype($getcode) === 'array'){
$tnumber = preg_replace("/[^-0-9]+/", '', $getcode[0]['loc_code'])+1;
}else{
 $tnumber=1;
}	
$loc_code = "LOC".$tnumber;
			
	$add_rec=$db->qry("insert into locations (loc_code,block_name,loc_name,hosp_id,fcgid) values ('$loc_code','$block_name','$loc_name','$hosp_id', '$fcgid')");
	echo json_encode($add_rec);
	
  }
 if($_GET['act']=='del'){
	 //delete the data
    $db->qry("delete from locations where loc_id=".$_GET['loc_id']);
     echo "Locations deleted Successfully!";
}
  if($_GET['act']=='st'){
	  //changing the status of the location
    $db->qry("update  locations set status=".$_GET['status']." where loc_id=".$_GET['loc_id']);
      echo "Status Change Successfully!";
}

if ($_GET['act']=='for_bed_allocation'){

	$beds_array = array("blocks" => array(
					array(
						"rooms" => array(
						array(
							"beds" => array(
							array(
								"bed_id" => 1,
								"is_allocated" => 0
							), array(
								"bed_id" => 2,
								"is_allocated" => 1
							)), "room_name" => 'Emergency'
						),
						array(
							"beds" => array(
							array(
								"bed_id" => 3,
								"is_allocated" => 0
							), array(
								"bed_id" => 4,
								"is_allocated" => 1
							)), "room_name" => 'General'
						)
					), "block_name" => 'Block-A'

					),
					array(
						"rooms" => array(
						array(
							"beds" => array(
							array(
								"bed_id" => 5,
								"is_allocated" => 0
							), 
							array(
								"bed_id" => 6,
								"is_allocated" => 1
							)), "room_name" => 'Emergency'
						),
						array(
							"beds" => array(
							array(
								"bed_id" => 7,
								"is_allocated" => 0
							), 
							array(
								"bed_id" => 8,
								"is_allocated" => 1
							)), "room_name" => 'General'
						)
					), "block_name" => 'Block-B'

					)
			));
	//echo "<pre>", print_r($beds_array), "</pre>";
	echo json_encode($beds_array);
}
?>