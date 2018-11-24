<?php
include_once("dbclass.php");
$db=new db();
/*retrieving all the data*/
if($_GET['action'] === 'all' ){
	$result =$db->qry("SELECT * FROM staff ");
	echo json_encode($result);
}
/*inserting the data */
if($_GET['action'] === 'add'){
	extract($_POST);
	//print_r($_POST);
	$result = "INSERT INTO staff(staff_name,staff_department,staff_salary) 
	  VALUES ('$staff_name','$staff_department','$staff_salary')";
	$staff_insert = $db->qry($result);

	echo json_encode($staff_insert);
}
/*updating the data*/
if($_GET['action']=== 'update') {
	
	extract($_POST);
	$result="UPDATE staff SET 
		staff_name = '$staff_name',	
		staff_department = '$staff_department',	
		staff_salary = '$staff_salary'
		WHERE staff_id = '$staff_id' " ;
		
	$staff_update = $db->qry($result);
	
	if ($staff_update) {
		echo "Updated successfully";
	} else {
		echo "Fail";
	}
}
/*deleting the data */
if($_GET['action']==='delete'){
   $staff_delete = $db->qry("DELETE FROM staff WHERE staff_id=".$_GET['staff_id']);
	if ($staff_delete) {
		echo " deleted Successfully!";
	} else {
		echo "Fail";
	}
}
/*change status of staff*/
if($_GET['action']==='staff_status' and $_GET['id']!== null){
	$q=$db->qry("SELECT staff_status FROM staff where staff_id=".$_GET['id']);
	if($q[0]['staff_status']==1){
		$query="UPDATE staff SET staff_status=0 WHERE staff_id=".$_GET['id'];
	}else{
		$query="UPDATE staff SET staff_status=1 WHERE staff_id=".$_GET['id'];
	}
	$update=$db->qry($query);
	if($update){
		echo("updated successfully");
	}
}

?>