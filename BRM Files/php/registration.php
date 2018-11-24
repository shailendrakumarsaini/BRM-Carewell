<?php


include_once("dbclass.php");
$db=new db();
if($_GET['action']=='all'){
	
	$res=$db->qry("select * from health_1");
  	echo json_encode($res);
}

	

if($_GET['action']=='add')
{
	extract($_POST);
//	echo "insert into health_1(mr_no,name_ms,name_first,name_middle,name_last,birth,next_kn_name,photo,patient,case_file_no,issued_to,gender,mobile_no,mobile1_no,relation,next_kn_address,vip_patient,old_reg,address,nationality,occupation,email,remarks,area,city,blood_group,portal_access,aadhar_id,state,country,religion,custom_list) values('$mr_no','$name_ms','$name_first','$name_middle','$name_last','$birth','$next_kn_name','$photo','$patient','$case_file_no','$issued_to','$gender','$mobile_no','$mobile1_no','$relation','$next_kn_address','$vip_patient','$old_reg','$address','$nationality','$occupation','$email','$remarks','$area','$city','$blood_group','$portal_access','$aadhar_id','$state','$country','$religion','$custom_list')";

  $add_rec=$db->qry("insert into health_1(mr_no,name_ms,name_first,name_middle,name_last,birth,next_kn_name,photo,patient,case_file_no,issued_to,gender,mobile_no,mobile1_no,relation,next_kn_address,vip_patient,old_reg,address,nationality,occupation,email,remarks,area,city,blood_group,portal_access,aadhar_id,state,country,religion,custom_list) values('$mr_no','$name_ms','$name_first','$name_middle','$name_last','$birth','$next_kn_name','$photo','$patient','$case_file_no','$issued_to','$gender','$mobile_no','$mobile1_no','$relation','$next_kn_address','$vip_patient','$old_reg','$address','$nationality','$occupation','$email','$remarks','$area','$city','$blood_group','$portal_access','$aadhar_id','$state','$country','$religion','$custom_list')");

  echo json_encode($add_rec);
 }

if($_GET['action']=='up')
{
extract($_POST);
    
  $update=$get_rec=$db->qry("update health_1 set mr_no='$mr_no',name_ms='$name_ms',name_first='$name_first',name_middle='$name_middle',name_last='$name_last',birth='$birth',next_kn_name='$next_kn_name',photo='$photo',patient='$patient',case_file_no='$case_file_no',issued_to='$issued_to',gender='$gender',mobile_no='$mobile_no',mobile1_no='$mobile1_no',relation='$relation',next_kn_address='$next_kn_address',vip_patient='$vip_patient',old_reg='$old_reg',address='$address',nationality='$nationality',occupation='$occupation',email='$email',remarks='$remarks',area='$area',city='$city',blood_group='$blood_group',portal_access='$portal_access',aadhar_id='$aadhar_id',state='$state',country='$country',religion='$religion',custom_list='$custom_list' where id='$id'");
 
 echo("updated successfully");
 //$update=$get_rec=$db->qry("update health_1 set name_ms='$name_ms',name_first='$name_first',name_middle='$name_middle',name_last='$name_last',birth='$birth' where id='$id'"); 
}

if($_GET['action']=='del'){
    $db->qry("delete from health_1 where id=".$_GET['id']);
    echo " deleted Successfully!";
}

if($_GET['action']=='update_status' and $_GET['regi_id']!=null)
{
	$q=$db->qry("select status from health_1 where id="._GET['regi_id']);
	
	if(q[0]['health_status']==1)
	{
		$query=("update health_1 set health_status=0 where id="._GET['regi_id']);
	}
	else
	{
		$query=("update health_1 set health_status=1 where id="._GET['regi_id']);
	}
	
	$update=$db->qry($query);
	
	if($update)
	{
	echo "updated successfully";
	}
}


?>
