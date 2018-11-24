<?php
include_once('dbclass.php');
$db = new db();

if($_GET['action']== 'all') {
    //Get all dr_consultation details.

	$rec = $db->qry("SELECT DISTINCT dc.*, u.name, u.qualification, f.fcname FROM Dr_consultation as dc JOIN user AS u ON dc.dr_id = u.uid JOIN fecilities AS f ON f.fcid = dc.fcid");  
	echo json_encode($rec);
}

if($_GET['action']== 'add') {
    //Add new Dr_consultation.

    extract($_POST);
    
    $res = $db->qry("SELECT amount, valid_days, valid_visits from Dr_consultation WHERE fcid = '" . $fcid . "' AND dr_id = " . $dr_id);

    if(gettype($res) === 'array') {
        $query = "UPDATE Dr_consultation SET 
                            dr_id = " . $dr_id . ",
                            fcid = '" . $fcid . "', 
                            amount = " . $amount . ", 
                            valid_days = " . $valid_days . ", 
                            valid_visits = " . $valid_visits . " WHERE fcid = '" . $fcid . "' AND dr_id = " . $dr_id;
    } else {
	    $query = "INSERT INTO Dr_consultation(dr_id, fcid, amount, valid_days, valid_visits) 
	                VALUES ('$dr_id', '$fcid', '$amount', '$valid_days', '$valid_visits')" ;
    }

	$add_res = $db->qry($query);
	
	echo json_encode($add_res);
}

if($_GET['action']== 'update') {
    //Update Dr_consultation data.

	extract($_POST);
	$query = "UPDATE Dr_consultation SET 
				dr_id = '$dr_id',
				fcid = '$fcid',
				amount = '$amount',
                valid_days = '$valid_days',
                valid_visits = '$valid_visits' WHERE dr_consult_id ='$dr_consult_id'";
				 
	$update_res= $db->qry($query);
	
	echo("Updated successfully");
}

if($_GET['action']== 'delete' && $_GET['dr_consult_id'] !== '') {
    //Delete Dr_consultation.

	$db->qry("DELETE FROM patient_info WHERE dr_consult_id=".$_GET['dr_consult_id']);
	echo("Deleted successfully");
}

if($_GET['action']== 'get_op_types' && $_GET['dr_id'] !== '') {
    //Get op types of a specific doctor.

	$op_type_res = $db->qry("SELECT Dr_consultation.*, fecilities.fcname FROM Dr_consultation JOIN fecilities ON fecilities.fcid = Dr_consultation.fcid WHERE dr_id= " .$_GET['dr_id'] . " AND fecilities.fcgid = 1");
	echo json_encode($op_type_res);
}

if($_GET['action']== 'get_ip_types' && $_GET['dr_id'] !== '') {
    //Get op types of a specific doctor.

	$ip_type_res = $db->qry("SELECT Dr_consultation.*, fecilities.fcname FROM Dr_consultation JOIN fecilities ON fecilities.fcid = Dr_consultation.fcid WHERE dr_id= " .$_GET['dr_id'] . " AND fecilities.fcgid = 2");
	echo json_encode($ip_type_res);
}

if($_GET['action']== 'get_amount' && $_GET['dr_consult_id'] !== '') {
    //Amount details of specific op type of a doctors.

	$amount_res = $db->qry("SELECT * FROM Dr_consultation WHERE dr_consult_id = '" . $_GET['dr_consult_id'] . "'");
	echo json_encode($amount_res);
}

if($_GET['action'] == 'update_status' && $_GET['dr_consult_id'] != null) {
    //Change status of a dr_consultation.

	$q = $db->qry("SELECT * FROM Dr_consultation where 	dr_consult_id = " . $_GET['dr_consult_id']);
	
	if($q[0]['con_status'] == 1) {

		 $query="UPDATE Dr_consultation SET con_status = 0 WHERE dr_consult_id = " . $_GET['dr_consult_id'];
	}
	else {
		$query="UPDATE Dr_consultation SET con_status = 1 WHERE dr_consult_id = " . $_GET['dr_consult_id'];
	}
	
	$update_status = $db->qry($query);
	
	if ($update_status) {
		echo "Status changed";
	} else {

		echo "Status change failed";
	}
}

if($_GET['action']== 'is_consultation_of_dr_exist') {
    //Is the consultation of dr exit or not
	
    //print_r($_POST);
    $res = $db->qry("SELECT amount, valid_days, valid_visits from Dr_consultation WHERE consultation_group = '" . $_POST['consultation_group'] . "' AND fcid = '" . $_POST['fcid'] . "' AND dr_id = " . $_POST['dr_id']);
	
	echo json_encode($res);
}

?>