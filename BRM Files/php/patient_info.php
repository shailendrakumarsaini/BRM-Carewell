<?php
include_once("dbclass.php");
$db = new db();

if($_GET['action'] == 'all') {
    // Get All Data
	$rec=$db->qry("SELECT p.*, u.name AS dr_name, u.qualification, FROM patient_info AS p JOIN patient_consultation AS pc ON p.patient_id = pc.patient_id JOIN user AS u ON pc.dr_id = u.uid");
	echo json_encode($rec);
}

if($_GET['action'] == 'patient_details' && $_GET['patient_id'] !== '') {
    // Get Patient Name, City, Father name
	$rec=$db->qry("SELECT p.patient_id, p.name, p.father_name, p.city, p.mobile, p.age, p.gender FROM patient_info AS p WHERE p.patient_id = '" . $_GET['patient_id'] . "'");
    echo json_encode($rec);
}

if($_GET['action'] == 'today_visits') {
    // Get Today OP Visits
	$today_date = date("Y-m-d H:i:s", strtotime(date("Y-m-d")));

	$rec=$db->qry("SELECT pc.patient_id, pc.p_visit_id, p.name, u.name AS dr_name, u.qualification, pv.convert_to_inpatient FROM patient_consultation AS pc JOIN patient_info AS p ON pc.datetime BETWEEN '" . $today_date . "' AND DATE_ADD('" . $today_date . "', INTERVAL 1 DAY) AND p.patient_id = pc.patient_id JOIN user AS u ON u.uid = pc.dr_id JOIN patient_visit AS pv ON pv.p_visit_id = pc.p_visit_id");

	echo json_encode($rec);
}

if($_GET['action'] == 'today_ip_visits') {
    
    // Get Today IP Visits
	$today_date = date("Y-m-d H:i:s", strtotime(date("Y-m-d")));

	$get_visit_type_id = $db->qry("SELECT fcid FROM fecilities WHERE fcname='IP consultation'");
	$visit_type = $get_visit_type_id[0]['fcid'];

	$rec=$db->qry("SELECT pv.p_visit_id, p.name, u.name AS dr_name,u.qualification FROM patient_visit AS pv JOIN patient_info AS p ON p.patient_id = pv.patient_id AND pv.visit_type = '" . $visit_type . "' AND pv.visit_date BETWEEN '" . $today_date . "' AND DATE_ADD('" . $today_date . "', INTERVAL 1 DAY) JOIN patient_room_allocation AS pra ON pra.p_room_visit_id = pv.p_visit_id JOIN user AS u ON u.uid = pra.p_room_doctor");

	echo json_encode($rec);
}

if($_GET['action'] == 'specificdate_op_visits' && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {
    
    // Get OP visits on specific date

	$from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
	$to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));

	$visit_type = 1;

	$rec = $db->qry("SELECT pc.patient_id, pc.p_visit_id, pc.diagnosis, pc.dr_id, pc.isCasualty, p.name, p.mobile, p.city, p.age, p.father_name, p.gender, u.name AS dr_name, u.qualification FROM patient_consultation AS pc JOIN patient_info AS p ON p.patient_id = pc.patient_id JOIN user AS u ON u.uid = pc.dr_id JOIN patient_visit AS pv ON pv.p_visit_id = pc.p_visit_id WHERE pc.datetime BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pv.visit_type = '" . $visit_type . "'");

	echo json_encode($rec);
}

if($_GET['action'] == 'specificdate_ip_visits' && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {
    
    // Get IP visits on specific date

	$from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
	$to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));

	//$get_visit_type_id = $db->qry("SELECT fcid FROM fecilities WHERE fcname='IP consultation'");
	$visit_type = 2;

    $rec = $db->qry("SELECT p.patient_id, pv.p_visit_id, p.name, p.mobile, p.city, p.age, p.father_name, p.gender, Ip.isBillSettled, Ip.total_package_amount, Ip.admit_date, Ip.incharge_doctor_id, u.name AS dr_name, u.qualification, us.name AS surgeon_dr_name, us.qualification AS surgeon_dr_qualification, ua.name AS anesthesian_dr_name, ua.qualification AS anesthesian_dr_qualification, hs.schemeName, Ip.department, Ip.initial_diagnosis, s.spname, b.bed_id, b.bed_code, l.loc_name FROM patient_visit AS pv JOIN patient_info AS p ON p.patient_id = pv.patient_id AND pv.visit_type = '" . $visit_type . "' AND pv.check_in_out = 0 JOIN Inpatient AS Ip ON Ip.p_visit_id = pv.p_visit_id JOIN user AS u ON u.uid = Ip.incharge_doctor_id LEFT JOIN user AS us ON us.uid = Ip.surgeon_doctor_id LEFT JOIN user AS ua ON ua.uid = Ip.anesthesian_doctor_id JOIN HealthSchemes AS hs ON hs.schemeId = Ip.scheme_id JOIN specialities AS s ON s.spid = Ip.department JOIN RoomAllotment AS ra ON ra.visitId = Ip.p_visit_id AND checkInOrCheckOut = 'checkIn' JOIN bed_master AS b ON b.bed_id = ra.bedId JOIN locations AS l ON l.loc_id = b.bed_loc_id WHERE Ip.admit_date BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY)");

	echo json_encode($rec);
}

if($_GET['action'] === 'active_ip_visits') {
    
    // Get IP visits on specific date

	$ip_date = date("Y-m-d H:i:s", strtotime($_GET['ip_date']));

	$visit_type = 2;

	$rec = $db->qry("SELECT p.patient_id, pv.p_visit_id, p.name, p.mobile, p.city, p.age, p.father_name, p.gender, Ip.isBillSettled, Ip.total_package_amount, Ip.admit_date, Ip.incharge_doctor_id, u.name AS dr_name, u.qualification, us.name AS surgeon_dr_name, us.qualification AS surgeon_dr_qualification, ua.name AS anesthesian_dr_name, ua.qualification AS anesthesian_dr_qualification, hs.schemeName, Ip.department, Ip.initial_diagnosis, s.spname, b.bed_id, b.bed_code, l.loc_name FROM patient_visit AS pv JOIN patient_info AS p ON p.patient_id = pv.patient_id AND pv.visit_type = '" . $visit_type . "' AND pv.check_in_out = 0 JOIN Inpatient AS Ip ON Ip.p_visit_id = pv.p_visit_id JOIN user AS u ON u.uid = Ip.incharge_doctor_id LEFT JOIN user AS us ON us.uid = Ip.surgeon_doctor_id LEFT JOIN user AS ua ON ua.uid = Ip.anesthesian_doctor_id JOIN HealthSchemes AS hs ON hs.schemeId = Ip.scheme_id JOIN specialities AS s ON s.spid = Ip.department JOIN RoomAllotment AS ra ON ra.visitId = Ip.p_visit_id AND checkInOrCheckOut = 'checkIn' JOIN bed_master AS b ON b.bed_id = ra.bedId JOIN locations AS l ON l.loc_id = b.bed_loc_id WHERE Ip.discharge_status = 0");

	echo json_encode($rec);
}

if($_GET['action'] === 'ipDetailsOfpatient' && $_GET['patient_id'] !== null) {
    
    // Get IP visits on specific date

	$visit_type = 2;

	$rec = $db->qry("SELECT p.patient_id, pv.p_visit_id, p.name, p.mobile, p.city, p.age, p.father_name, p.gender, Ip.isBillSettled, 
                        Ip.total_package_amount, Ip.admit_date, Ip.incharge_doctor_id, Ip.surgeon_doctor_id, Ip.anesthesian_doctor_id, 
                        Ip.surgery_or_medical, Ip.package_or_regular, Ip.department, Ip.initial_diagnosis, u.name AS dr_name, u.qualification, 
                        us.name AS surgeon_dr_name, us.qualification AS surgeon_dr_qualification, ua.name AS anesthesian_dr_name, ua.qualification AS anesthesian_dr_qualification,
                        hs.schemeName, s.spname, b.bed_id, b.bed_code, l.loc_name, rm.ref_id, rm.ref_name, rm.ref_city, rm.ref_occupation, up.uid AS pro_id, up.name AS pro_name, 
                        up.city AS pro_city FROM patient_visit AS pv JOIN patient_info AS p ON p.patient_id = pv.patient_id AND pv.visit_type = '" . $visit_type . "' AND pv.check_in_out = 0 
                           
                            JOIN Inpatient AS Ip ON Ip.p_visit_id = pv.p_visit_id 
                            JOIN user AS u ON u.uid = Ip.incharge_doctor_id 
                            LEFT JOIN user AS us ON us.uid = Ip.surgeon_doctor_id 
                            LEFT JOIN user AS ua ON ua.uid = Ip.anesthesian_doctor_id 
                            JOIN HealthSchemes AS hs ON hs.schemeId = Ip.scheme_id 
                            JOIN specialities AS s ON s.spid = Ip.department 
                            JOIN RoomAllotment AS ra ON ra.visitId = Ip.p_visit_id AND checkInOrCheckOut = 'checkIn' 
                            JOIN bed_master AS b ON b.bed_id = ra.bedId JOIN locations AS l ON l.loc_id = b.bed_loc_id 
                            LEFT JOIN referral_master AS rm ON rm.ref_id = pv.ref_id LEFT JOIN user AS up ON up.uid = pv.pro_id
                         
                         WHERE Ip.discharge_status = 0 AND pv.patient_id = " . $_GET['patient_id']);

	$getMainConsultantVisits = $db->qry("SELECT count(caseSheetId) AS inchargeVisitCount FROM CaseSheet WHERE visitId = " . $rec[0]['p_visit_id'] . " AND visitedDoctor =  " . $rec[0]['incharge_doctor_id'] . " GROUP BY visitId");

	
	if(gettype($getMainConsultantVisits) === 'array') {
		$rec[0]['inchargeVisitCount'] = $getMainConsultantVisits[0]['inchargeVisitCount'] + 1;
	} else {
		$rec[0]['inchargeVisitCount'] = 1;
	}


	if($rec[0]['surgeon_doctor_id'] !== null) {
		$getSurgeonConsultantVisits = $db->qry("SELECT count(caseSheetId) AS surgeonVisitCount FROM CaseSheet WHERE visitId = " . $rec[0]['p_visit_id'] . " AND visitedDoctor =  " . $rec[0]['surgeon_doctor_id'] . " GROUP BY visitId");
		
		if(gettype($getSurgeonConsultantVisits) === 'array') {
			$rec[0]['surgeonVisitCount'] = $getSurgeonConsultantVisits[0]['surgeonVisitCount'] + 1;
		} else {
			$rec[0]['surgeonVisitCount'] = 1;
		}
	} else {
		$rec[0]['surgeonVisitCount'] = null;
	}

	if($rec[0]['anesthesian_doctor_id'] !== null) {
		$getAnesthesainConsultantVisits = $db->qry("SELECT count(caseSheetId) AS anesthesianVisitCount FROM CaseSheet WHERE visitId = " . $rec[0]['p_visit_id'] . " AND visitedDoctor =  " . $rec[0]['anesthesian_doctor_id'] . " GROUP BY visitId");
		
		if(gettype($getAnesthesainConsultantVisits) === 'array') {
			$rec[0]['anesthesianVisitCount'] = $getAnesthesainConsultantVisits[0]['anesthesianVisitCount'] + 1;
		} else {
			$rec[0]['anesthesianVisitCount'] = 1;
		}
	} else {
		$rec[0]['anesthesianVisitCount'] = null;
	}

	echo json_encode($rec);
}

if($_GET['action'] === 'roomHistoryOfVisit' && $_GET['visitId'] !== null) {

	$res = $db->qry("SELECT ra.enteredDate, ra.vacatedDate, DATEDIFF(IFNULL(ra.vacatedDate, CURDATE()), ra.enteredDate) AS noOfDays, b.bed_loc_name, b.bed_code FROM RoomAllotment AS ra JOIN bed_master AS b ON b.bed_id = ra.bedId WHERE visitId = " . $_GET['visitId']);
	echo json_encode($res);
}

if($_GET['action'] === 'paidAmountOfVisit' && $_GET['visitId'] !== null) {

	$res = $db->qry("SELECT SUM(pt.amount) AS paidAmount FROM patient_transactions AS pt WHERE pt.p_visit_id = " . $_GET['visitId'] . " GROUP BY pt.p_visit_id");
	echo json_encode($res);
}

if($_GET['action'] == 'specific_visit' && $_GET['visit_id'] !== '') {
    
    //Get specific op visit details

	$rec=$db->qry("SELECT p.patient_id, p.name, p.city, p.mobile, p.age, p.father_name, p.gender, pv.visit_date, u.name AS dr_name, u.qualification, dc.fcid, dc.valid_days, dc.valid_visits, pc.dr_consult_id, pc.dr_id, pc.amount, rm.ref_name, pt.receipt_no, pt.receipt_code, f.fcname FROM patient_visit AS pv JOIN patient_consultation AS pc ON pc.p_visit_id = pv.p_visit_id JOIN user AS u ON u.uid = pc.dr_id JOIN Dr_consultation AS dc ON dc.dr_consult_id = pc.dr_consult_id LEFT JOIN referral_master AS rm ON pv.ref_id = rm.ref_id JOIN patient_info AS p ON p.patient_id = pv.patient_id LEFT JOIN patient_transactions AS pt ON pt.p_visit_id = pv.p_visit_id JOIN fecilities AS f ON f.fcid = dc.fcid WHERE pv.p_visit_id = '" . $_GET['visit_id'] . "' AND receipt_status = 0 ORDER BY pt.transaction_id ASC LIMIT 0,1");
	
	$rec[0]['paidDetails'] = $db->qry("SELECT f.fcname, u.name, u.qualification, pt.amount FROM patient_transactions AS pt JOIN fecilities AS f ON f.fcid = pt.fcid LEFT JOIN user AS u ON u.uid = pt.doctor_id WHERE pt.receipt_code = '" . $rec[0]['receipt_code'] . "'");

	echo json_encode($rec);
}

if($_GET['action'] == 'specific_ip_visit' && $_GET['visit_id'] !== '') {
    
    //Get specific ip visit details
    
	$rec=$db->qry("SELECT p.patient_id, p.name, p.city, p.age, p.father_name, p.gender, p.mobile, DATE_FORMAT(pv.visit_date, '%d-%m-%Y') AS visit_date, Ip.total_package_amount, u.name AS dr_name, u.qualification, us.name AS surgeon_dr_name, us.qualification AS surgeon_dr_qualification, ua.name AS anesthesian_dr_name, ua.qualification AS anesthesian_dr_qualification, rm.ref_name, b.bed_loc_name, b.bed_code, Ip.advance_amount, Ip.total_package_amount, pt.receipt_no, f.fcname FROM patient_visit AS pv JOIN Inpatient AS Ip ON Ip.p_visit_id = pv.p_visit_id JOIN RoomAllotment AS rat ON rat.visitId = pv.p_visit_id AND rat.checkInOrCheckOut = 'checkIn' JOIN bed_master AS b ON b.bed_id = rat.bedId JOIN user AS u ON u.uid = Ip.incharge_doctor_id LEFT JOIN user AS us ON us.uid = Ip.surgeon_doctor_id LEFT JOIN user AS ua ON ua.uid = Ip.anesthesian_doctor_id LEFT JOIN referral_master AS rm ON pv.ref_id = rm.ref_id JOIN patient_info AS p ON p.patient_id = pv.patient_id LEFT JOIN patient_transactions AS pt ON pt.p_visit_id = pv.p_visit_id JOIN fecilities AS f ON f.fcid = pv.visit_type WHERE pv.p_visit_id = '" . $_GET['visit_id'] . "' ORDER BY pt.transaction_id ASC LIMIT 0,1");

	echo json_encode($rec);
}

if($_GET['action'] == 'visit_details' && $_GET['patient_id'] !== '') {
    
    //Get visit details of specific patient for op

	$rec=$db->qry("SELECT p.patient_id, p.name, pv.p_visit_id, DATE_FORMAT(pv.visit_date, '%d-%m-%Y') AS visit_date, pv.visit_type, pc.amount, u.name AS dr_name,u.qualification, rm.ref_name, dc.fcid, dc.valid_days, dc.valid_visits, f.fcname  FROM patient_visit AS pv JOIN patient_consultation AS pc ON pc.p_visit_id = pv.p_visit_id JOIN user AS u ON u.uid = pc.dr_id LEFT JOIN referral_master AS rm ON rm.ref_id = pv.ref_id JOIN Dr_consultation AS dc ON dc.dr_consult_id = pc.dr_consult_id JOIN patient_info AS p ON p.patient_id = pv.patient_id JOIN fecilities AS f ON f.fcid = dc.fcid WHERE pc.patient_id = '" . $_GET['patient_id'] . "'");

	echo json_encode($rec);
}

if($_GET['action'] === 'get_valid_visited_count_indate' && $_GET['visit_id'] !== null && $_GET['dr_consult_id'] !== null) {
//counting the valid visit of the patient visit id
    $res = $db->qry("SELECT count(p_visit_id) AS valid_visited_count FROM patient_consultation WHERE dr_consult_id = " . $_GET['dr_consult_id'] . " AND p_visit_id > " . $_GET['visit_id'] . " AND amount = 0");

    echo json_encode($res);
}

if($_GET['action'] == 'previous_visit_details' && $_GET['patient_id'] !== '') {
    
    //Get previous visit details of specific patient

	$rec=$db->qry("SELECT pv.patient_id, p.name, pv.p_visit_id, DATE_FORMAT(pv.visit_date, '%d-%m-%Y') AS visit_date, f.fcname, rm.ref_name FROM patient_visit AS pv LEFT JOIN referral_master AS rm ON rm.ref_id = pv.ref_id JOIN fecilities AS f ON f.fcid = pv.visit_type JOIN patient_info AS p ON p.patient_id = pv.patient_id WHERE pv.patient_id = '" . $_GET['patient_id'] . "' ORDER BY pv.p_visit_id DESC");

	echo json_encode($rec);
}

if($_GET['action'] == 'previous_bill_details' && $_GET['patient_id'] !== '') {
    
    //Get previous visit details of specific patient

    $rec = $db->qry("SELECT pt.transaction_id, pt.p_visit_id, DATE_FORMAT(pv.visit_date, '%d-%m-%Y') AS visit_date, DATE_FORMAT(pt.transaction_date, '%d-%m-%Y') AS transaction_date, pt.receipt_no, pt.hospital_id, f.fcname, b.bcname, sum(pt.amount) AS amount, pt.payment_type, pt.receipt_code FROM patient_transactions AS pt JOIN patient_visit AS pv ON pv.p_visit_id = pt.p_visit_id JOIN fecilities AS f ON f.fcid = pv.visit_type JOIN billcategory AS b ON b.bcid = pt.bcid WHERE pt.patient_id = '" . $_GET['patient_id'] . "' AND pt.receipt_status = 0 GROUP BY pt.receipt_code ORDER BY pt.date_time DESC");
    
    //$rec = $db->qry("SELECT sum(pt.amount), pv.patient_id FROM patient_transactions AS pt JOIN patient_visit AS pv ON pv.p_visit_id = pt.p_visit_id  WHERE pt.patient_id = '" . $_GET['patient_id'] . "' AND pt.receipt_status = 0 GROUP BY pt.receipt_code");

	echo json_encode($rec);
}

if($_GET['action'] == 'mobile_n' && $_GET['search_1'] !=='') {

    //Search whether given mobile no is existed or not

	$p_mob = $db->qry("SELECT mobile FROM patient_info WHERE mobile = '".$_GET['search_1']."'  ");
	
	echo json_encode($p_mob);
}

if($_GET['action'] == 'addhar_n' && $_GET['search_2'] !=='') {

    //Search whether given aadhar no is existed or not

	$p_add = $db->qry("SELECT aadhar_no FROM patient_info WHERE aadhar_no ='".$_GET['search_2']."' ");
	
	echo json_encode($p_add);
}

if($_GET['action'] == 'search' && $_GET['search_string'] !== '')  {
    
    //Search whether patient is existed or not

	$get_patients_dets = $db->qry("SELECT * FROM patient_info WHERE (name LIKE '%" . $_GET['search_string'] . "%' OR mobile LIKE '%" . $_GET['search_string'] . "%' OR  city LIKE '%" . $_GET['search_string'] . "%' OR aadhar_no LIKE '%" . $_GET['search_string'] . "%') AND patient_id NOT IN(SELECT patient_id FROM patient_visit WHERE check_in_out = 0)");

	echo json_encode($get_patients_dets);
}


if($_GET['action'] == 'inpatient_search' && $_GET['search_string'] !== '')  {
    
    //Search whether inpatient is existed or not

	$get_patients_dets = $db->qry("SELECT * FROM patient_info WHERE (name LIKE '%" . $_GET['search_string'] . "%' OR mobile LIKE '%" . $_GET['search_string'] . "%' OR  city LIKE '%" . $_GET['search_string'] . "%' OR aadhar_no LIKE '%" . $_GET['search_string'] . "%') AND patient_id IN(SELECT DISTINCT patient_id FROM patient_visit)");

	echo json_encode($get_patients_dets);
}

if($_GET['action'] == 'aadhar_search' && $_GET['aadhar_no'] !== '' )  {
    
    //Search whether given aadhar no is existed or not
    
	$get_patients_dets = $db->qry("SELECT * FROM patient_info WHERE aadhar_no  = '" . $_GET['aadhar_no'] . "'");
	
	echo json_encode($get_patients_dets);
}

if($_GET['action']== 'add_new') {

    //Add new patient and op details
    extract($_POST);

	$visit_type = $patient_new_reg['visit_type'];
	registerPatient($patient_new_reg['basic_info'][0], $db);
	$patient_id = $db->id();

	$ins_new_patient = patientConsultation($patient_new_reg['consultation'][0], $visit_type, $patient_id, $db);
	
	if ($ins_new_patient) {

		echo 'Success';
	} else {

		echo 'Fail';
	}
}

if($_GET['action']== 'add_new_mobile') {

    //Add new patient and op details for ionic

	$patient_new_reg = json_decode($_POST['patient_new_reg'], true);
	$visit_type = $patient_new_reg['visit_type'];
	registerPatient($patient_new_reg['basic_info'][0], $db);
	$patient_id = $db->id();

	$ins_new_patient = patientConsultation($patient_new_reg['consultation'][0], $visit_type, $patient_id, $db);
	
	if ($ins_new_patient) {

		echo json_encode('Success');
	} else {

		echo json_encode('Fail');
	}
}

if($_GET['action']== 'add_visit') {

    //Add patient visit

	extract($_POST);

	$visit_type = $patient_visit['visit_type'];
	$patient_id = $patient_visit['patient_id'];
	$ins_visit = patientConsultation($patient_visit['consultation'][0], $visit_type, $patient_id, $db);
	
	if ($ins_visit) {

		echo 'Success';
	} else {

		echo 'Fail';
	}
}

if($_GET['action']== 'add_visit_mobile') {

    //Add patient visit for mobile.

	$patient_visit = json_decode($_POST['patient_visit'], true);

	$visit_type = $patient_visit['visit_type'];
	$patient_id = $patient_visit['patient_id'];
	$ins_visit = patientConsultation($patient_visit['consultation'][0], $visit_type, $patient_id, $db);
	
	if ($ins_visit) {

		echo json_encode('Success');
	} else {

		echo json_encode('Fail');
	}
}

if($_GET['action']== 'update') {

    //Update patient details.

	extract($_POST);
    
    if($date_of_birth === '') {
        $date_of_birth = 'NULL';
    } else {
        $date_of_birth = date("Y-m-d", strtotime($date_of_birth));
    }
	
	$query = "UPDATE patient_info SET 
				name= '$name',
				father_name= '$father_name',
				date_of_birth = $date_of_birth,
				gender ='$gender',
				city= '$city',
				district= '$district',
				state= '$state',
				pincode= '$pincode',
				mobile= '$mobile',
				age= '$age',
				aadhar_no= '$aadhar_no',
				email= '$email',
                house_no= '$house_no',
				street= '$street','
				loc= '$location' WHERE patient_id='$patient_id'";

	$update_res = $db->qry($query);
	
	if ($update_res) {
		echo "Updated successfully";
	} else {

		echo "Fail";
	}
}

if($_GET['action'] == 'update_status' && $_GET['id'] != null) {

    //Update status of a patient

	$q = $db->qry("SELECT * FROM patient_info where patient_id = " . $_GET['id']);
	
	if($q[0]['patient_status'] == 1) {

		 $query="UPDATE patient_info SET patient_status = 0 WHERE patient_id = " . $_GET['id'];
	}
	else {

		$query="UPDATE patient_info SET patient_status = 1 WHERE patient_id = " . $_GET['id'];
	}
	
	$update_status = $db->qry($query);
	
	if ($update_status) {

		echo "Status changed";
	} else {

		echo "Status change failed";
	}
}

function registerPatient($basic_info, $db) {
    
    //Function for register a patient.

    $ins_basic = $db->qry("INSERT INTO patient_info SET 
						name = '" . $basic_info['name'] . "',
						father_name = '" . $basic_info['father_name'] . "',
						age = '" . $basic_info['age'] . "',
						gender = '" . $basic_info['gender'] . "',
						city = '" . $basic_info['city'] . "',
						mobile = '" . $basic_info['mobile'] . "'");

    /*if ($basic_info['aadhar_no'] === '') {
        $basic_info['aadhar_no'] = "NULL";
    }

    if ($basic_info['pincode'] === '') {
        $basic_info['pincode'] = "NULL";
    }
	
	$date_of_birth = date("Y-m-d", strtotime($basic_info['date_of_birth']));
	$ins_basic = $db->qry("INSERT INTO patient_info SET
						name = '" . $basic_info['name'] . "',
						father_name = '" . $basic_info['father_name'] . "',
						date_of_birth = '" . $date_of_birth . "',
						age = '" . $basic_info['age'] . "',
						gender = '" . $basic_info['gender'] . "',
						house_no = '" . $basic_info['house_no'] . "',
						street = '" . $basic_info['street'] . "',
						loc = '" . $basic_info['loc'] . "',
						city = '" . $basic_info['city'] . "',
						district = '" . $basic_info['district'] . "',
						state = '" . $basic_info['state'] . "',
						pincode = " . $basic_info['pincode'] . ",
						mobile = '" . $basic_info['mobile'] . "',
						aadhar_no = " . $basic_info['aadhar_no'] . ",
						email = '" . $basic_info['email'] . "'");
							
		$patientId = $db->id();

        //upload image
        $target_dir = "../uploads/patients/";
		
      	$actualFileName = basename($_FILES["refPhoto"]["name"]);
        $explodeFileName = explode(".", $actualFileName);
        $extensionOfFile = end($explodeFileName);
		$storedFileName = $patientId . '.' . $extensionOfFile;
        $target_file = $target_dir . $storedFileName;
		
        if (move_uploaded_file($_FILES["refPhoto"]["tmp_name"], $target_file)) {
			echo "The file ". basename( $_FILES["refPhoto"]["name"]). " has been uploaded.";
		} else {
			echo "Sorry, there was an error uploading your file.";
		}
        
        echo $updateReferral = $db->qry("UPDATE patient_info SET image = '" . $storedFileName . "' WHERE 	patient_id = " .$patientId);	 */
						
}

function patientConsultation($consultation, $visit_type, $patient_id, $db) {
    //Function for adding op details.
	
	//$visit_date_time = date("Y-m-d H:i:s");
	$visit_date_time = date("Y-m-d H:i:s", strtotime($consultation['date_of_op']));
	$get_facility_group_id = $db->qry("SELECT fcgid FROM fecilities WHERE fcid = " . $consultation['fcid']);
    $visit_type = $get_facility_group_id[0]['fcgid'];

    //$get_bc_id = $db->qry("SELECT bcid, bcname FROM billcategory WHERE bccode='OPC'");
    //$bc_id = $get_bc_id[0]['bcid'];
	
	if ($consultation['ref_id'] === '') {

	 	$consultation['ref_id'] = "NULL";
	}
	if ($consultation['pro_id'] === '') {

		$consultation['pro_id'] = "NULL";
   	}
	$ins_visit = $db->qry("INSERT INTO patient_visit SET 
							patient_id = '" . $patient_id . "',
							ref_id = " . $consultation['ref_id'] . ",
							pro_id = " . $consultation['pro_id'] . ",
							visit_type = '" . $visit_type . "',
							visit_date = '" . $visit_date_time . "',
							user_id = '" . $consultation['user_id'] . "',
							check_in_out = '1'");

	$visit_id = $db->id();

	$ins_patient_consultation = $db->qry("INSERT INTO patient_consultation SET 
							patient_id = '" . $patient_id . "',
							p_visit_id = '" . $visit_id . "',
							dr_id = '" . $consultation['dr_id'] . "',
							dr_consult_id = '" . $consultation['dr_consult_id'] . "',
							amount = '" . $consultation['consultation_amount'] . "',
							diagnosis = '" . $consultation['diagnosis'] . "',
							visit_type = '" . $visit_type . "',
							datetime = '" . $visit_date_time . "'");
	
	if($consultation['isCasualty']) {
		$db->qry("UPDATE patient_consultation SET isCasualty = 1 WHERE p_consult_id = " . $db->id());
	}
	
	$financial_start_date = date_create(date("01-04-" . date("Y")));

	if(date_create(date("d-m-Y")) >= $financial_start_date) {
		$financial_year = date("y") . "-" . date("y", strtotime("+1 year"));
	} else {
		$financial_year = date("y", strtotime("-1 year")) . "-" . date("y");
	}
	$get_last_rec = $db->qry("SELECT IFNULL(MAX(receipt_no), 0) AS receipt_no FROM patient_transactions WHERE hospital_id = '1' AND financial_year = '" . $financial_year . "'");
	
	$receipt_no = (int) $get_last_rec[0]["receipt_no"];
	$receipt_no++;

	$get_hospital_code = $db->qry("SELECT hcode FROM hospitals WHERE hid = '1'");
	$receipt_code = $get_hospital_code[0]['hcode'] . "/" . $financial_year . "/" . $receipt_no;
	
	$get_fcname = $db->qry("SELECT fcname FROM fecilities WHERE fcid = " . $consultation['fcid']);

	if((int) $consultation['consultation_amount'] > 0) {
        
		$ins_patient_transaction = $db->qry("INSERT INTO patient_transactions SET 
												patient_id = '" . $patient_id . "',
												p_visit_id = " . $visit_id . ",
												fcid = '" . $consultation['fcid'] . "',
												purpose_of_payment = '" . $get_fcname[0]['fcname'] . "',
												amount = '" . $consultation['consultation_amount'] . "',
												payment_type = 'Cash',
												hospital_id = '1',
												financial_year = '" . $financial_year . "',
												user_id = '" . $consultation['user_id'] . "',
												doctor_id = '" . $consultation['dr_id'] . "',
												receipt_no = '" . $receipt_no . "',
												receipt_code = '" . $receipt_code . "',
												date_time = '" . date("Y-m-d H:i:s") . "',
												transaction_date = '" . date("Y-m-d", strtotime($visit_date_time)) . "'");
	}
	
	if($consultation['isCasualty']) {
		
		foreach($consultation['consultantDoctors'] AS $consultantDoctor) {
			if($consultantDoctor['dr_id'] !== '' && $consultantDoctor['dr_id'] !== null && $consultantDoctor['dr_id'] > 0) {
				
				//$get_dr_name = $db->qry("SELECT u.name FROM user AS u WHERE u.uid = " . $consultantDoctor['dr_id']);
				
				$db->qry("INSERT INTO CasualtyDoctors SET 
							patientId = " . $patient_id . ",
							visitId = " . $visit_id . ",
							doctorId = " . $consultantDoctor['dr_id'] . ",
							amount = " . $consultantDoctor['amount']);
							
				$db->qry("INSERT INTO patient_transactions SET 
							patient_id = '" . $patient_id . "',
							p_visit_id = " . $visit_id . ",
							fcid = '" . $consultation['fcid'] . "',
							purpose_of_payment = '" . $get_fcname[0]['fcname'] . "',
							amount = '" . $consultantDoctor['amount'] . "',
							payment_type = 'Cash',
							hospital_id = '1',
							financial_year = '" . $financial_year . "',
							user_id = '" . $consultation['user_id'] . "',
							doctor_id = '" . $consultantDoctor['dr_id'] . "',
							receipt_no = '" . $receipt_no . "',
							receipt_code = '" . $receipt_code . "',
							date_time = '" . date("Y-m-d H:i:s") . "',
							transaction_date = '" . date("Y-m-d", strtotime($visit_date_time)) . "'");
			}
		}
		
		$get_fcid = $db->qry("SELECT fcid, fcname FROM fecilities WHERE fcname = 'Casualty Charges'");
		
		$db->qry("INSERT INTO CasualtyCharges SET 
					patientId = " . $patientId . ",
					visitId = " . $visit_id . ",
					casualtyCharge = " . $consultation['casualtyCharges'] . ",
					remarks = " . $consultation['casualtyRemarks'] . "'");
		
		$db->qry("INSERT INTO patient_transactions SET 
												patient_id = '" . $patient_id . "',
												p_visit_id = " . $visit_id . ",
												fcid = '" . $get_fcid[0]['fcid'] . "',
												purpose_of_payment = '" . $get_fcid[0]['fcname'] . "',
												amount = '" . $consultation['casualtyCharges'] . "',
												payment_type = 'Cash',
												hospital_id = '1',
												financial_year = '" . $financial_year . "',
												user_id = '" . $consultation['user_id'] . "',
												receipt_no = '" . $receipt_no . "',
												receipt_code = '" . $receipt_code . "',
												date_time = '" . date("Y-m-d H:i:s") . "',
												transaction_date = '" . date("Y-m-d", strtotime($visit_date_time)) . "'");
	}
	
	return $ins_patient_consultation;
}

if($_GET['action'] === 'delete' && $_GET['p_visit_id']!== null ){
	//Delete of the particular patient visit
	$del_visit_data = $db->qry("DELETE FROM patient_visit WHERE p_visit_id = '" . $_GET['p_visit_id'] ."'");
	$del_visit_data = $db->qry("DELETE FROM patient_consultation WHERE p_visit_id = '" . $_GET['p_visit_id'] ."'");
	$del_transaction = $db->qry("DELETE FROM patient_transactions WHERE p_visit_id = '" . $_GET['p_visit_id'] . "'");
}

	


?>
