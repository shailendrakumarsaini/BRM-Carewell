<?php
include_once("dbclass.php");
$db=new db();

if($_GET['action']=='select'){
	//retrieving the hospital data
	$res=$db->qry("select * from hospitals");
  	echo json_encode($res);
  }
  
if($_GET[action]=='select_down'){
	$res=$db->qry("select * from hospitals where status=1");
  	echo json_encode($res);
}

 if($_GET['action'] == 'group'){
	 $rec=$db->qry("select fcgid, fcgname from fecilities_group where fcg_status = 1");
	 echo json_encode($rec);
 }
 if($_GET['action']=='add'){
 //Inserting the hospital data
 $hosp=$_POST['hosp'];
 
 // $getcode = $db->qry("select hcode from hospitals order by hid desc limit 1");


// if(count($getcode)>0)
// {
// $tnumber = preg_replace("/[^-0-9]+/", '', $getcode[0]['hcode'])+1;
// }else{
 // $tnumber=1;
// }	

// $hcode = "H".$tnumber;
 
 
	 $qry="insert into hospitals (hcode,hname,haddress,hcity,hphone,hmobile,hemail,fecility_grp) values('".$hosp['hcode']."','".$hosp['name']."','".$hosp['address']."','".$hosp['city']."','".$hosp['phone']."','".$hosp['mobile']."','".$hosp['email']."','".$hosp['fecility_grp']."')";
    $db->qry($qry);
    $res=$db->qry("select * from hospitals ");
  	echo json_encode($res);
  } 
  
  if($_GET['action']=='update'){
 //updating the hospital data
 extract($_POST);
 
 
  $res = $db->qry("update hospitals set hcode='$hcode',hname='$name',haddress='$address',hcity='$city',hmobile='$mobile',hphone='$phone',hemail='$email', fecility_grp='$fecility_grp'  where hid='$hospital_id'"); 
 
  echo "Updated !";
   // $res=$db->qry("select * from hospitals ");
  //	echo json_encode($res);
  } 
  
  
 if($_GET['action']=='delete'){
	 //delete the hospital data
    $db->qry("delete from hospitals where hid=".$_GET['delete_hid']);
    $res=$db->qry("select * from hospitals ");
  	echo json_encode($res);
} 
 if($_GET['act']=='st'){
	 //change the hospital status
    $db->qry("update  hospitals set status=".$_GET['status']." where hid=".$_GET['hid']);
      echo "Status Change Successfully!";
}

if($_GET['action'] === "get_main_hospital_details") {
    $res = $db->qry("SELECT * FROM hospitals LIMIT 0,1");
    echo json_encode($res);
}

?>