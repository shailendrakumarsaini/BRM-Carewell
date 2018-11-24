<?php
include_once("dbclass.php");
$db=new db();

	if($_GET['action']=='search_patient'){
	$sname = "and (patient_master.pt_name like '%".$_GET['sname']."%') OR (patient_master.pt_code like '%".$_GET['sname']."%') OR (patient_master.pt_mobile like '%".$_GET['sname']."%') OR (patient_master.pt_aadhaar like '%".$_GET['sname']."%')"; 
	

	$res=$db->qry("select patient_master.pt_id,patient_master.pt_code,patient_master.pt_name,patient_master.pt_mobile,patient_register.primary_dr_name,patient_register.primary_dr_name,visit_type from patient_master,patient_register where patient_master.pt_id=patient_register.pt_id $sname group by patient_master.pt_id order by visit_id desc");
    echo json_encode($res);
	}

  if($_GET['action']=='get_payment_details'){
	  
	if($_GET['visittype']=='OUT'){  
	
	$res=$db->qry("select patient_master.pt_id,patient_master.pt_name,patient_master.pt_mobile,patient_register.primary_dr_name from patient_master,patient_register where patient_master.pt_id=patient_register.pt_id and patient_register.pt_id=".$_GET['pat_id']." and date(visit_date)='".date('Y-m-d')."'");
	
	$fee=$db->qry("select *,'0' as payamount from patient_consulting_log,fecilities where patient_consulting_log.fac_id=fecilities.fcid and patient_id=".$_GET['pat_id']." and amount!=paid");
 
	$finalres = array('patientinfo'=>$res,'feeinfo'=>$fee);
	
	echo json_encode($finalres);
	
	}else{
		
	$res=$db->qry("select * from patient_master,patient_register where patient_master.pt_id=patient_register.pt_id and patient_register.pt_id=".$_GET['pat_id']."");
	echo json_encode($res);
	
	}
  }
  
  
  
  
  if($_GET['action']=='bill'){
	  
 $feeinfo=$_POST['fee_info'];
 $patient_info=$_POST['patient_info'];
  
 //print_r($patient_info);exit;
 for($i=0;$i<count($feeinfo);$i++){

 $getorg = $db->qry("select * from  hospitals where fecility_grp=".$feeinfo[$i]['fac_group_id']);
 $getdoctor = $db->qry("select * from user where name='".$patient_info[$i]['primary_dr_name']."'");
 
 $billorder = $db->qry("select max(bill_order) as border from billing");	
 $billorder = $billorder[0]['border']+1;
  
 $billno = $getorg[0]['hcode']."/18/".$billorder;
	
	$qry3="insert ignore into billing (bill_date,bill_org_id,bill_org_name_city,bill_order,bill_no,patient_id,patient_type,facility_id,facility_name,facilitator_id,facilitator_name,facilitator_qualification,bill_amount,bill_discount,bill_total,bill_tax,total_tax,paid,due,payment_type,paid_date_time,remarks) values(now(),'".$getorg[0]['hid']."','".$getorg[0]['hcity']."','".$billorder."','$billno',".$patient_info[$i]['pt_id'].",'OPC','".$feeinfo[$i]['fcid']."','".$feeinfo[$i]['fcname']."','".$getdoctor[0]['uid']."','".$getdoctor[0]['name']."','".$getdoctor[0]['qualification']."','".$feeinfo[$i]['amount']."',0,'".$feeinfo[$i]['amount']."','$bill_tax','$total_tax','".$feeinfo[$i]['paid']."',0,'$payment_type',now(),'$remarks')";
    $db->qry($qry3);
 
 }

 $hsp = $db->qry("select * from  hospitals where fecility_grp=1");
 $patnt = $db->qry("select * from  billing,patient_master where billing.patient_id=patient_master.pt_id and bill_no='".$billno."'");
 
$res = array('hsp'=>$hsp,'patnt'=>$patnt);	 
		
  	echo json_encode($res);
  }  
  
 
  ?>