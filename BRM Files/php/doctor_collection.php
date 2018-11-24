<?php
    include_once ("dbclass.php");
    $db=new db();

    //Get Referral Details between form date and to date
    if($_GET['action'] === 'getReferralDetails' && $_GET['referralId'] !== null && $_GET['fromDate'] !== null && $_GET['toDate']) {
        
        $from_date_time = date("Y-m-d H:i:s", strtotime($_GET['fromDate']));
        $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['toDate']));

        $getReferralDetails = $db->qry("SELECT p.patient_id, p.name, p.city, p.gender, p.age, p.mobile, p.father_name, pv.p_visit_id, pv.ref_id, DATE_FORMAT(pv.visit_date, '%Y-%m-%d') AS visit_date, rm.ref_name, rm.ref_occupation, rm.ref_org_name, IF(i.total_package_amount <= 0, sum(pt.amount), i.total_package_amount) AS packageAmount, rp.* FROM patient_visit AS pv LEFT JOIN referral_master rm ON pv.ref_id = rm.ref_id LEFT JOIN Inpatient AS i ON pv.p_visit_id = i.p_visit_id LEFT JOIN patient_transactions AS pt ON pt.p_visit_id = pv.p_visit_id AND pt.bcid <> 1 LEFT JOIN patient_info AS p ON p.patient_id = pv.patient_id LEFT JOIN ReferralPayment AS rp ON rp.Vid = pv.p_visit_id WHERE pv.ref_id IS NOT NULL AND pv.visit_date BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pv.ref_id = " . $_GET['referralId'] . " GROUP BY pt.p_visit_id ORDER BY rp.isPaid");

        echo json_encode($getReferralDetails);
    }

    if($_GET['action'] === 'getDoctorDetails' && $_GET['doctorId'] !== null && $_GET['fromDate'] !== null && $_GET['toDate'] !== null) {

        $from_date_time = date("Y-m-d H:i:s", strtotime($_GET['fromDate']));
        $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['toDate']));

        $getDoctorDetails = $db->qry("SELECT p.patient_id, p.name, p.city, p.gender, p.age, p.mobile, p.father_name, pv.p_visit_id, DATE_FORMAT(pv.visit_date, '%Y-%m-%d') AS visit_date, cs.visitedDoctor, count(cs.caseSheetId) AS visitCount, IF(ip.total_package_amount <= 0, sum(pt.amount), ip.total_package_amount) AS packageAmount, ip.discharge_status, dp.*, u.name AS dr_name FROM CaseSheet AS cs LEFT JOIN patient_visit AS pv ON pv.p_visit_id = cs.visitId LEFT JOIN Inpatient AS ip ON ip.p_visit_id = cs.visitId LEFT JOIN patient_transactions AS pt ON pt.p_visit_id = cs.visitId AND pt.bcid <> 1 LEFT JOIN patient_info AS p ON p.patient_id = cs.patientId LEFT JOIN DoctorPayment AS dp ON dp.VId = cs.visitId LEFT JOIN user AS u ON u.uid = cs.visitedDoctor WHERE cs.visitedDoctor = " . $_GET['doctorId'] . " AND pv.visit_date BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) GROUP BY cs.visitId ORDER BY dp.isPaid");

        echo json_encode($getDoctorDetails);
    }

    if($_GET['action'] === "get_op_dr_collection_details" && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {
		//get dr collection details
        $from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
        $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));
		
		$op_bc_id_arr = $db->qry("SELECT bcid FROM billcategory WHERE bcname = 'OP Consultation'");
		$op_bc_id = $op_bc_id_arr[0]['bcid'];

        $res = $db->qry("SELECT pt.doctor_id, COUNT(pt.p_visit_id) AS visit_count, SUM(pt.amount) AS amount, u.name, u.qualification FROM patient_transactions AS pt JOIN user AS u ON u.uid = pt.doctor_id WHERE pt.date_time BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pt.receipt_status = 0 AND pt.bcid = " . $op_bc_id . " GROUP BY pt.doctor_id");

        echo json_encode($res);
    }


    if($_GET['action'] === "get_op_dr_collection_details_breakup" && $_GET['from_date'] !== null && $_GET['to_date'] !== null && $_GET['dr_id'] !== null) {
		//get dr collection details
        $from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
        $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));
		
		$op_bc_id_arr = $db->qry("SELECT bcid FROM billcategory WHERE bcname = 'OP Consultation'");
		$op_bc_id = $op_bc_id_arr[0]['bcid'];

        $res = $db->qry("SELECT p.name, p.father_name, p.gender, p.age, p.city, p.mobile, pt.amount AS amount, pt.date_time AS date FROM patient_transactions AS pt JOIN patient_info AS p ON pt.patient_id = p.patient_id WHERE pt.doctor_id = " . $_GET['dr_id'] . " AND pt.date_time BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pt.receipt_status = 0 AND pt.bcid = " . $op_bc_id);

        echo json_encode($res);
    }
	
	
	if($_GET['action'] === "get_ip_dr_collection_details" && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {
		//get dr collection details
        $from_date_time = date("Y-m-d", strtotime($_GET['from_date']));
        $to_date_time = date("Y-m-d", strtotime($_GET['to_date']));

        $res = $db->qry("SELECT cs.visitedDoctor AS doctor_id, COUNT(cs.caseSheetId) AS visit_count, SUM(dc.amount) AS amount, u.name, u.qualification FROM CaseSheet AS cs JOIN user AS u ON u.uid = cs.visitedDoctor JOIN Dr_consultation AS dc ON dc.dr_id = cs.visitedDoctor AND dc.type_of_consultation = cs.consultationType WHERE cs.date BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) GROUP BY cs.visitedDoctor");

        echo json_encode($res);
    }

    if($_GET['action'] === "get_ip_dr_collection_details_breakup" && $_GET['from_date'] !== null && $_GET['to_date'] !== null && $_GET['dr_id'] !== null) {
		//get dr collection details
        $from_date_time = date("Y-m-d", strtotime($_GET['from_date']));
        $to_date_time = date("Y-m-d", strtotime($_GET['to_date']));

        $res = $db->qry("SELECT p.name, p.father_name, p.gender, p.age, p.city, p.mobile, dc.amount AS amount, cs.date FROM CaseSheet AS cs JOIN patient_info AS p ON p.patient_id = cs.patientId JOIN Dr_consultation AS dc ON dc.dr_id = cs.visitedDoctor AND dc.type_of_consultation = cs.consultationType WHERE cs.visitedDoctor = " . $_GET['dr_id'] . " AND cs.date BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY)");

        echo json_encode($res);
    }
	
	if($_GET['action'] === "get_op_ref_collection_details" && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {
		//getting reference collection details

        $from_date_time = date("Y-m-d", strtotime($_GET['from_date']));
        $to_date_time = date("Y-m-d", strtotime($_GET['to_date']));

        $op_bc_id_arr = $db->qry("SELECT bcid FROM billcategory WHERE bcname = 'OP Consultation'");

        $op_bc_id = $op_bc_id_arr[0]['bcid'];

        $res = $db->qry("SELECT COUNT(pt.p_visit_id) AS visit_count, SUM(pt.amount) AS amount, pv.ref_id, rf.ref_name FROM patient_transactions AS pt JOIN patient_visit AS pv ON pv.p_visit_id = pt.p_visit_id JOIN referral_master AS rf ON rf.ref_id = pv.ref_id WHERE pt.date_time BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pt.receipt_status = 0 AND pv.ref_id IS NOT NULL AND (pt.bcid = '" . $op_bc_id . "') GROUP BY pv.ref_id, pt.bcid");

        echo json_encode($res);
    }

    if($_GET['action'] === "get_op_ref_collection_details_breakup" && $_GET['from_date'] !== null && $_GET['to_date'] !== null && $_GET['ref_id'] !== null) {
		//getting reference collection details

        $from_date_time = date("Y-m-d", strtotime($_GET['from_date']));
        $to_date_time = date("Y-m-d", strtotime($_GET['to_date']));

        $op_bc_id_arr = $db->qry("SELECT bcid FROM billcategory WHERE bcname = 'OP Consultation'");

        $op_bc_id = $op_bc_id_arr[0]['bcid'];

        $res = $db->qry("SELECT p.name, p.father_name, p.gender, p.age, p.city, p.mobile, pt.amount AS amount, pt.date_time FROM patient_transactions AS pt JOIN patient_visit AS pv ON pv.p_visit_id = pt.p_visit_id JOIN referral_master AS rf ON rf.ref_id = pv.ref_id JOIN patient_info AS p ON p.patient_id = pt.patient_id WHERE pv.ref_id = " . $_GET['ref_id'] . " AND pt.date_time BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pt.receipt_status = 0 AND pv.ref_id IS NOT NULL AND (pt.bcid = '" . $op_bc_id . "')");

        echo json_encode($res);
    }
    
    
    if($_GET['action'] === "get_ip_ref_collection_details" && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {
		//getting reference collection details

        $from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
        $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));

        $res = $db->qry("SELECT COUNT(pv.p_visit_id) AS visit_count, SUM(ip.total_package_amount) AS amount, rf.ref_id, rf.ref_name FROM Inpatient AS ip JOIN patient_visit AS pv ON pv.p_visit_id = ip.p_visit_id LEFT JOIN referral_master AS rf ON rf.ref_id = pv.ref_id JOIN patient_info AS p ON p.patient_id = pv.patient_id WHERE ip.admit_date BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pv.ref_id IS NOT NULL GROUP BY pv.ref_id");

        echo json_encode($res);
    }
	
	if($_GET['action'] === "get_ip_ref_collection_details_breakup" && $_GET['from_date'] !== null && $_GET['to_date'] !== null && $_GET['ref_id'] !== null) {
		//getting reference collection details

        $from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
        $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));

        $res = $db->qry("SELECT p.name, p.father_name, p.gender, p.age, p.city, p.mobile, ip.total_package_amount AS amount FROM Inpatient AS ip JOIN patient_visit AS pv ON pv.p_visit_id = ip.p_visit_id LEFT JOIN referral_master AS rf ON rf.ref_id = pv.ref_id JOIN patient_info AS p ON p.patient_id = pv.patient_id WHERE pv.ref_id = " . $_GET['ref_id'] . " AND ip.admit_date BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pv.ref_id IS NOT NULL");

        echo json_encode($res);
    }



?>