<?php
include_once("dbclass.php");
$db=new db();

if($_GET['action']=='select'){
	
	$res=$db->qry("select * from patient_master,patient_register where patient_master.pt_id=patient_register.pt_id and DATE(visit_date)='".date('Y-m-d')."'");
  	echo json_encode($res);
  }
 if($_GET['action']=='room'){
	$res=$db->qry("select * from locations");
  	echo json_encode($res);
  } 
   if($_GET['action']=='get_bed'){
	$res=$db->qry("select * from  bed_master where bed_loc_id=".$_GET['roomid']);
  	echo json_encode($res);
  } 
 
if($_GET['action']=='add'){
 //echo "tet";exit;
 $pat=$_POST['pat'];
 
 $getcode = $db->qry("select pt_code from patient_master order by pt_id desc limit 1");


if(count($getcode)>0)
{
$tnumber = preg_replace("/[^-0-9]+/", '', $getcode[0]['pt_code'])+1;
}else{
 $tnumber=170001;
}	

$getdoctor = $db->qry("select * from user where name='".$_POST['consultant']."'");
$getreferal = $db->qry("select ref_id from  referral_master where ref_name='".$_POST['referral']."'");
$facinfo = $db->qry("select * from  fecilities where fcode='OPC'");


$pcode = "P".$tnumber;
$patname = $_POST['pt_type']." ".$pat['pt_name']; 
if($_POST['pt_visit_type']==''){ $ptvisittype='OUT'; }else{ $ptvisittype = 'IN'; }
 
 
 
	$qry="insert ignore into patient_master (pt_code,pt_name,pt_guardian_type,pt_guardian_name,pt_address,pt_city,pt_mobile,pt_whatsapp,pt_age,pt_gender,pt_martial_status,reg_date) values('$pcode','".$patname."','".$_POST['pt_guardian_type']."','".$pat['pt_guardian_name']."','".$pat['pt_address']."','".$_POST['pt_city']."','".$_POST['mobile']."','".$_POST['whatsapp']."','".$_POST['pt_age']."','".$_POST['pt_gender']."','".$_POST['pt_martial_status']."',now())";
    $db->qry($qry);
	
	$patientid = $db->id();
	
	$qry2="insert ignore into patient_register (visit_date,visit_type,pt_id,pt_name,pt_age,pt_mobile,primary_dr_id,primary_dr_name,ref_id,ref_name,op_fee) values(now(),'".$ptvisittype."','".$patientid."','".$patname."','".$_POST['pt_age']."','".$_POST['mobile']."','".$getdoctor[0]['uid']."','".$_POST['consultant']."','".$getreferal[0]['ref_id']."','".$_POST['referral']."','".$_POST['pt_op_fee']."')";
    $db->qry($qry2);
	
	$qry3="insert ignore into patient_consulting_log (patient_id,fac_group_id,fac_id,amount,paid,due_amount,created,last_updated) values($patientid,".$facinfo[0]['fcgid'].",".$facinfo[0]['fcid'].",'".$_POST['pt_op_fee']."',0,'".$_POST['pt_op_fee']."',now(),now())";
    $db->qry($qry3);

if($ptvisittype=='IN'){	

$qry2="insert ignore into inpatient_register (pt_id,pt_name,pt_mobile,pt_age,ref_id,ref_name,pt_bed_id,pt_bed_name,pt_room_id,pt_room_name,pt_doctor_id,pt_doctor_name,pt_admit_datetime,pt_diagnosis,pt_admit_type,pt_payment_type) values('".$patientid."','".$patname."','".$_POST['mobile']."','".$_POST['pt_age']."','".$getreferal[0]['ref_id']."','".$_POST['referral']."','".$_POST['pt_bed_id']."','".$beddata[0]['bed_code']."','".$beddata[0]['bed_loc_id']."','".$$beddata[0]['bed_loc_name']."','".$getdoctor[0]['uid']."','".$_POST['consultant']."',now(),'".$_POST['pt_diagnosis']."','".$_POST['pt_admit_type']."','".$_POST['pt_payment_type']."')";
$db->qry($qry2);
	
  	echo json_encode($res);
 }  
  
if($_GET['action']=='get_age'){
	 if($_GET['pdata']=='undefined'){ $agecond="IS NOT NULL"; }else{ $agecond="LIKE '%".$_GET['pdata']."%'"; }
	$res=$db->qry("select pt_age from patient_master where pt_age ".$agecond." group by pt_age limit 5");
    echo json_encode($res);
}

if($_GET['action']=='get_city'){
	  $agecond="LIKE '".$_GET['cdata']."%'";
	$res=$db->qry("select pt_city from patient_master where pt_city ".$agecond." group by pt_city limit 5");
    echo json_encode($res);
}
if($_GET['action']=='get_referral'){
	 if($_GET['sdata']=='undefined'){ $scond="IS NOT NULL"; }else{ $scond="LIKE '%".$_GET['sdata']."%'"; }
	$res=$db->qry("select ref_name from referral_master where ref_name ".$scond." group by ref_name limit 5");
    echo json_encode($res);
}
if($_GET['action']=='get_consultant'){
	 if($_GET['sdata']=='undefined'){ $scond="IS NOT NULL"; }else{ $scond="LIKE '%".$_GET['sdata']."%'"; }
	$res=$db->qry("select name from user where name ".$scond." and level_id=3 group by name limit 5");
    echo json_encode($res);
}
if($_GET['action']=='get_opfee'){
	 if($_GET['sdata']=='undefined'){ $scond="IS NOT NULL"; }else{ $scond="LIKE '%".$_GET['sdata']."%'"; }
	$res=$db->qry("select op_fee from patient_register where primary_dr_name ".$scond." group by op_fee limit 5");
    echo json_encode($res);
}
if($_GET['action']=='get_patientlist'){
	$res=$db->qry("select * from patient_master,patient_register where patient_master.pt_id=patient_register.pt_id group by patient_register.pt_id order by visit_id desc");
    echo json_encode($res);
}
if($_GET['action']=='get_visitpatient'){
	$res=$db->qry("select *,DATE(visit_date) as visit_date from patient_master,patient_register where patient_master.pt_id=patient_register.pt_id and patient_master.pt_code='".$_GET['pat_code']."' group by patient_master.pt_id order by visit_id");
    echo json_encode($res);
}


if($_GET['action']=='search_patient'){
	
$sname = "and (patient_master.pt_name like '%".$_GET['sname']."%') OR (patient_master.pt_code like '%".$_GET['sname']."%') OR (patient_master.pt_mobile like '%".$_GET['sname']."%') OR (patient_master.pt_aadhaar like '%".$_GET['sname']."%')"; 
	

	$res=$db->qry("select patient_master.pt_id,patient_master.pt_code,patient_master.pt_name,patient_master.pt_mobile,patient_register.primary_dr_name,patient_register.primary_dr_name,visit_type from patient_master,patient_register where patient_master.pt_id=patient_register.pt_id $sname group by patient_master.pt_id order by visit_id desc");

    echo json_encode($res);
} 


if($_GET['action']=='add_visit'){
extract($_POST);
	
	$getpt=$db->qry("select * from patient_master,patient_register where patient_master.pt_id=patient_register.pt_id and patient_register.pt_id=".$_POST['pt_id']);

	
	$qry2="insert ignore into patient_register (visit_date,visit_type,pt_id,pt_name,pt_age,pt_mobile,primary_dr_id,primary_dr_name,ref_id,ref_name,op_fee) values(now(),'".$getpt[0]['visit_type']."','".$_POST['pt_id']."','".$getpt[0]['pt_name']."','".$getpt[0]['pt_age']."','".$getpt[0]['pt_mobile']."','".$getpt[0]['primary_dr_id']."','".$getpt[0]['primary_dr_name']."','".$getpt[0]['ref_id']."','".$getpt[0]['ref_name']."','".$_POST['op_fee']."')";
    $db->qry($qry2);
	
	
	$facinfo = $db->qry("select * from  fecilities where fcode='OPC'");

	$qry3="insert ignore into patient_consulting_log (patient_id,fac_group_id,fac_id,amount,paid,due_amount,created,last_updated) values(".$_POST['pt_id'].",".$facinfo[0]['fcgid'].",".$facinfo[0]['fcid'].",'".$_POST['op_fee']."',0,'".$_POST['op_fee']."',now(),now())";
    $db->qry($qry3);	
	
  	echo "1";
  }  
   
  
?>