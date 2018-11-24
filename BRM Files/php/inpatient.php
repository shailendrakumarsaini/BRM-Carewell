<?php
include_once ("dbclass.php");
$db=new db();


if($_GET['action'] == 'all') {
	//retriving inpatient data
	$rec=$db->qry("SELECT * FROM Inpatient");
	echo json_encode($rec);
}
if($_GET['action'] === 'special') {
	
	$result= $db->qry("SELECT spid,spname FROM specialities");
	echo json_encode($result);
}
if($_GET['action'] == 'add') {
    //Adding inpatient data.

    extract($_POST);
    //print_r($_POST);

    $visit_type = 2;

    if($inpatient_data['surOrMed'] === "medical") {
        $inpatient_data['surgeon_dr_id'] = "NULL";
        $inpatient_data['anesthesia_dr_id'] = "NULL";
    }

    if($inpatient_data['packOrReg'] === "regular") {
        $inpatient_data['totalPackage'] = "0";
        //$inpatient_data['advAmount'] = "NULL";
    }

    $admit_date = date("Y-m-d H:i:s", strtotime($inpatient_data['admission_date']));
    //echo $inpatient_data['p_visit_id'];
    
    if($inpatient_data['p_visit_id'] !== "") {

        $update_visit = $db->qry("UPDATE patient_visit SET 
                                    visit_type = " . $visit_type . ",
                                    check_in_out = 0 WHERE p_visit_id = " . $inpatient_data['p_visit_id']);

        $p_visit_id = $inpatient_data['p_visit_id'];
    } else {

        $ins_visit = $db->qry("INSERT INTO patient_visit SET 
                            patient_id = '" . $inpatient_data['patient_id'] . "',
                            visit_type = '" . $visit_type . "',
                            visit_date = '" . $admit_date . "',
                            user_id = '" . $inpatient_data['user_id'] . "',
                            check_in_out = '0'");
        $p_visit_id = $db->id();
    }

    $get_bc_id = $db->qry("SELECT bcid, bcname FROM billcategory WHERE bccode='ADV'");
    $bc_id = $get_bc_id[0]['bcid'];
    $purpose_of_payment = $get_bc_id[0]['bcname']; 


    $ins_room_allotment = $db->qry("INSERT INTO RoomAllotment SET 
                                        patientId = " . $inpatient_data['patient_id'] . ",
                                        visitId = " . $p_visit_id . ",
                                        bedId = " . $inpatient_data['bed_id'] . ",
                                        roomRentAmount = " . $inpatient_data['rentAmount'] . ",
                                        checkInOrCheckOut = 'checkIn',
                                        enteredDate = '" . date("Y-m-d", strtotime($inpatient_data['admission_date'])) . "',
                                        createdUser = " . $inpatient_data['user_id'] . ",
                                        updatedUser = " . $inpatient_data['user_id']);
    
	$inpatient_query = "INSERT INTO Inpatient SET 	
                            surgery_or_medical = '" . $inpatient_data['surOrMed'] . "',	
                            package_or_regular = '" . $inpatient_data['packOrReg'] . "',	
                            scheme_id = '" . $inpatient_data['scheme_id'] . "',	
                            incharge_doctor_id = '" . $inpatient_data['dr_id'] . "',		
                            surgeon_doctor_id = " . $inpatient_data['surgeon_dr_id'] . ",	
                            anesthesian_doctor_id = " . $inpatient_data['anesthesia_dr_id'] . ",		
                            total_package_amount = " . $inpatient_data['totalPackage'] . ",	
                            approx_no_of_days = '" . $inpatient_data['no_of_days'] . "',	
                            admit_date = '" . $admit_date . "',
							department = '" . $inpatient_data['department_id'] . "',
							initial_diagnosis = '" . $inpatient_data['init_diagnosis'] . "',
                            user_id = '" . $inpatient_data['user_id'] . "',
                            p_visit_id = " . $p_visit_id . ",
                            patient_id = '" . $inpatient_data['patient_id'] . "'";
				
	$add_res = $db->qry($inpatient_query);
	echo json_encode($add_res);
}

if($_GET['action'] == 'inpatient_count') {
    //Get inpatient count

	$rec = $db->qry("SELECT count(Ip.patient_id) AS inpatient_count FROM Inpatient AS Ip WHERE Ip.discharge_status = '0'");

	echo json_encode($rec);
}

if($_GET['action'] == 'total_amount'){
    //Get total amount
	
	$total_op = $db->qry("SELECT SUM(amount) AS op_amount FROM patient_consultation");
	
	if($total_op[0]['op_amount'] === null) {
		$total_op[0]['op_amount'] = "0";
	}
	
	$total_ip = $db->qry("SELECT SUM(advance_amount) AS ip_adv_amount FROM Inpatient");
	if($total_ip[0]['ip_adv_amount'] === null) {
        
		$total_ip[0]['ip_adv_amount'] = "0";
	}
	
	$total_amounts[0]['op_amount'] = $total_op[0]['op_amount'];
	$total_amounts[0]['ip_adv_amount'] = $total_ip[0]['ip_adv_amount'];
	
	echo json_encode($total_amounts);
}

if($_GET['action'] === 'get_active_inpatients') {
	//active inpatient data
    $get_visit_type_id = $db->qry("SELECT fcid FROM fecilities WHERE fcname='IP consultation'");
    $visit_type = $get_visit_type_id[0]['fcid'];

    $get_ips = $db->qry("SELECT p.patient_id, p.name, p.age, p.gender, p.father_name, p.city, pv.p_visit_id, rat.bedId, u.name AS dr_name, u.qualification FROM patient_visit AS pv JOIN patient_info AS p ON p.patient_id = pv.patient_id JOIN Inpatient AS ip ON ip.p_visit_id = pv.p_visit_id JOIN user AS u ON u.uid = ip.incharge_doctor_id JOIN RoomAllotment AS rat ON rat.visitId = pv.p_visit_id AND rat.checkInOrCheckOut = 'checkIn' WHERE pv.visit_type = " . $visit_type . " AND pv.check_in_out = 0");

    echo json_encode($get_ips);
}

	
?>