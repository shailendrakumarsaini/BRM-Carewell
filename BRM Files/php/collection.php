<?php
include_once ("dbclass.php");
$db = new db();

if($_GET['action'] == 'add') {

    extract($_POST);

    $entered_date = date("Y-m-d H:i:s");
    $transaction_date = date("Y-m-d", strtotime($collection_data['transaction_date']));

    $financial_start_date = date_create(date("01-04-" . date("Y")));

    if(date_create(date("d-m-Y")) >= $financial_start_date) {
        $financial_year = date("y") . "-" . date("y", strtotime("+1 year"));
    } else {
        $financial_year = date("y", strtotime("-1 year")) . "-" . date("y");
    }

    $get_last_rec = $db->qry("SELECT IFNULL(MAX(receipt_no), 0) AS receipt_no FROM patient_transactions WHERE hospital_id = '" . $collection_data['hospital_id'] . "' AND financial_year = '" . $financial_year . "'");

    $receipt_no = (int) $get_last_rec[0]["receipt_no"];
    $receipt_no++;

    $get_hospital_code = $db->qry("SELECT hcode FROM hospitals WHERE hid = '" . $collection_data['hospital_id'] . "'");
    $receipt_code = $get_hospital_code[0]['hcode'] . "/" . $financial_year . "/" . $receipt_no;

    foreach($collection_data['paid_details'] AS $paid_details) {

        $get_bc_id = $db->qry("SELECT bcname FROM billcategory WHERE bcid = '" . $paid_details['bill_id'] . "'");
        $purpose_of_payment = $get_bc_id[0]['bcname'];

        $ins_patient_transaction = $db->qry("INSERT INTO patient_transactions SET
                                                patient_id = '" . $collection_data['patient_id'] . "',
                                                p_visit_id = " . $collection_data['p_visit_id'] . ",
                                                bcid = '" . $paid_details['bill_id'] . "',
                                                purpose_of_payment = '" . $purpose_of_payment . "',
                                                amount = '" . $paid_details['paidAmount'] . "',
                                                payment_type = '" . $collection_data['payment_type'] . "',
                                                hospital_id = '" . $collection_data['hospital_id'] . "',
                                                financial_year = '" . $financial_year . "',
                                                user_id = '" . $collection_data['user_id'] . "',
                                                doctor_id = '" . $collection_data['dr_id'] . "',
                                                receipt_no = '" . $receipt_no . "',
                                                receipt_code = '" . $receipt_code . "',
                                                remarks = '" . $collection_data['remark'] . "',
                                                date_time = '" . $entered_date . "',
                                                transaction_date = '" . $transaction_date . "'");

    }

    $receipt_details = get_receipt_details($receipt_code, true, $db);

    echo json_encode($receipt_details);
}

/*inserting the lab billing*/
if($_GET['action'] == 'add_test_lab_billing') {

    extract($_POST);

    $entered_date = date("Y-m-d H:i:s");
    $transaction_date = date("Y-m-d", strtotime($lab_billing_data['transaction_date']));

    $financial_start_date = date_create(date("01-04-" . date("Y")));

    if(date_create(date("d-m-Y")) >= $financial_start_date) {
        $financial_year = date("y") . "-" . date("y", strtotime("+1 year"));
    } else {
        $financial_year = date("y", strtotime("-1 year")) . "-" . date("y");
    }

    $get_last_rec = $db->qry("SELECT IFNULL(MAX(receipt_no), 0) AS receipt_no FROM patient_transactions WHERE hospital_id = '" . $lab_billing_data['hospital_id'] . "' AND financial_year = '" . $financial_year . "'");

    $receipt_no = (int) $get_last_rec[0]["receipt_no"];
    $receipt_no++;

    $get_hospital_code = $db->qry("SELECT hcode FROM hospitals WHERE hid = '" . $lab_billing_data['hospital_id'] . "'");
    $receipt_code = $get_hospital_code[0]['hcode'] . "/" . $financial_year . "/" . $receipt_no;

    $get_bc_id = $db->qry("SELECT bcid, bcname FROM billcategory WHERE bcname = 'LABS'");
    $purpose_of_payment = $get_bc_id[0]['bcname'];
    $bc_id = $get_bc_id[0]['bcid'];

    $ins_patient_transaction = $db->qry("INSERT INTO patient_transactions SET
                                            patient_id = '" . $lab_billing_data['patient_id'] . "',
                                            p_visit_id = " . $lab_billing_data['p_visit_id'] . ",
                                            bcid = '" . $bc_id . "',
                                            purpose_of_payment = '" . $purpose_of_payment . "',
                                            amount = '" . $lab_billing_data['total_paid_amount'] . "',
                                            payment_type = '" . $lab_billing_data['payment_type'] . "',
                                            hospital_id = '" . $lab_billing_data['hospital_id'] . "',
                                            financial_year = '" . $financial_year . "',
                                            user_id = '" . $lab_billing_data['user_id'] . "',
                                            doctor_id = '" . $lab_billing_data['dr_id'] . "',
                                            receipt_no = '" . $receipt_no . "',
                                            receipt_code = '" . $receipt_code . "',
                                            remarks = '" . $lab_billing_data['remark'] . "',
                                            date_time = '" . $entered_date . "',
                                            transaction_date = '" . $transaction_date . "'");

    $transaction_id = $db->id();

    foreach($lab_billing_data['test'] AS $test_details) {
        $ins_test_billing = $db->qry("INSERT INTO test_billing SET
                                            transaction_id = '" . $transaction_id . "',
                                            receipt_code = '" . $receipt_code . "',
                                            test_id = '" . $test_details['test_id'] . "',
                                            user_id = '" . $lab_billing_data['user_id'] . "',
                                            paid_amount = '" . $test_details['paid_amount'] . "'");
    }


	if($lab_billing_data['patient_type'] === 'Out Patient') {

        $investigationResults = $lab_billing_data['test'];
        $investigationResults[0]['resultGiven'] = false;

	    $get_doctor_id = $db->qry("SELECT dr_id FROM patient_consultation WHERE p_visit_id =  '" . $lab_billing_data['p_visit_id'] . "'");
		$ins_outpatient = $db->qry("INSERT INTO CaseSheet SET
						investigationsPerformed = '" . json_encode($lab_billing_data['test']) . "',
						investigationResults = '" . json_encode($investigationResults) . "',
					 	patientId = '" . $lab_billing_data['patient_id'] . "',
					 	visitId =  '" . $lab_billing_data['p_visit_id'] . "',
					 	visitedDoctor =  '" . $get_doctor_id[0]['dr_id'] . "',
						date = '" . date("Y-m-d") . "',
						createdUser = '" . $lab_billing_data['user_id'] . "',
						updatedUser = '" . $lab_billing_data['user_id'] . "'");
	}

    $receipt_details = get_receipt_details($receipt_code, true, $db);

    echo json_encode($receipt_details);
}

 if($_GET['action'] == 'add_pharmacy_billing') {

    extract($_POST);

    $entered_date = date("Y-m-d H:i:s");
    $transaction_date = date("Y-m-d", strtotime($pharmacy_billing['transaction_date']));

    $financial_start_date = date_create(date("01-04-" . date("Y")));

    if(date_create(date("d-m-Y")) >= $financial_start_date) {
        $financial_year = date("y") . "-" . date("y", strtotime("+1 year"));
    } else {
        $financial_year = date("y", strtotime("-1 year")) . "-" . date("y");
    }

    $get_last_rec = $db->qry("SELECT IFNULL(MAX(receipt_no), 0) AS receipt_no FROM patient_transactions WHERE hospital_id = '" . $pharmacy_billing['hospital_id'] . "' AND financial_year = '" . $financial_year . "'");

    $receipt_no = (int) $get_last_rec[0]["receipt_no"];
    $receipt_no++;

    $get_hospital_code = $db->qry("SELECT hcode FROM hospitals WHERE hid = '" . $pharmacy_billing['hospital_id'] . "'");
    $receipt_code = $get_hospital_code[0]['hcode'] . "/" . $financial_year . "/" . $receipt_no;

    $get_bc_id = $db->qry("SELECT bcid, bcname FROM billcategory WHERE bcname = 'PHARMACY'");
    $purpose_of_payment = $get_bc_id[0]['bcname'];
    $bc_id = $get_bc_id[0]['bcid'];

    if($pharmacy_billing['patient_name'] === '' || $pharmacy_billing['patient_name'] === null) {
        $ins_patient_transaction = $db->qry("INSERT INTO patient_transactions SET
                                                patient_id = '" . $pharmacy_billing['patient_id'] . "',
                                                p_visit_id = " . $pharmacy_billing['p_visit_id'] . ",
                                                bcid = '" . $bc_id . "',
                                                purpose_of_payment = '" . $purpose_of_payment . "',
                                                amount = '" . $pharmacy_billing['total_amount'] . "',
                                                payment_type = '" . $pharmacy_billing['payment_type'] . "',
                                                hospital_id = '" . $pharmacy_billing['hospital_id'] . "',
                                                financial_year = '" . $financial_year . "',
                                                user_id = '" . $pharmacy_billing['user_id'] . "',
                                                doctor_id = '" . $pharmacy_billing['dr_id'] . "',
                                                receipt_no = '" . $receipt_no . "',
                                                receipt_code = '" . $receipt_code . "',
                                                remarks = '" . $pharmacy_billing['remark'] . "',
                                                date_time = '" . $entered_date . "',
                                                transaction_date = '" . $transaction_date . "'");
    } else {
        $ins_patient_transaction = $db->qry("INSERT INTO patient_transactions SET
                                                bcid = '" . $bc_id . "',
                                                purpose_of_payment = '" . $purpose_of_payment . "',
                                                amount = '" . $pharmacy_billing['total_amount'] . "',
                                                payment_type = '" . $pharmacy_billing['payment_type'] . "',
                                                hospital_id = '" . $pharmacy_billing['hospital_id'] . "',
                                                financial_year = '" . $financial_year . "',
                                                user_id = '" . $pharmacy_billing['user_id'] . "',
                                                doctor_id = '" . $pharmacy_billing['dr_id'] . "',
                                                receipt_no = '" . $receipt_no . "',
                                                receipt_code = '" . $receipt_code . "',
                                                remarks = '" . $pharmacy_billing['remark'] . "',
                                                date_time = '" . $entered_date . "',
                                                transaction_date = '" . $transaction_date . "',
                                                patient_name = '" . $pharmacy_billing['patient_name'] . "'");
    }

    $transaction_id = $db->id();

    foreach($pharmacy_billing['Arr'] AS $med_details) {

        $get_stock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE medicine_stock_id = '" . $med_details['medicine_stock_id'] . "'");

        if(gettype($get_stock_reg) === 'array') {
            $quantity = $get_stock_reg[0]['quantity'];
            if($quantity > 0) {
                $quantity -= $med_details['req_qty'];

                $update_stock_reg = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $quantity . "' WHERE medicine_stock_id = '" . $med_details['medicine_stock_id'] . "'");

                $ins_test_billing = $db->qry("INSERT INTO pharmacy_billing SET
                                               transaction_id = '" . $transaction_id . "',
                                               receipt_code = '" . $receipt_code . "',
                                               medicine_id = '" . $med_details['med_id'] . "',
                                               user_id = '" . $pharmacy_billing['user_id'] . "',
                                               quantity = '" . $med_details['req_qty'] . "',
                                               medicine_stock_id = '" . $med_details['medicine_stock_id'] . "',
                                               purchase_price = '" . $med_details['purchase_price'] . "',
                                               paid_amount = '" . $med_details['price'] . "'");

			}
        }
    }

    if($pharmacy_billing['patient_name'] === '' || $pharmacy_billing['patient_name'] === null) {
        $receipt_details = get_receipt_details($receipt_code, true, $db);
    } else {
        $receipt_details = get_receipt_details($receipt_code, false, $db);
    }

    echo json_encode($receipt_details);
}

/*Get the latest visit with particular id*/
if($_GET['action'] === 'get_latest_visit' && $_GET['patient_id'] !== '') {

    $latest_visit_type = $db->qry("SELECT fg.fcgid FROM patient_visit AS pv JOIN fecilities_group AS fg ON fg.fcgid = pv.visit_type WHERE pv.patient_id = '" . $_GET['patient_id'] . "' ORDER BY pv.p_visit_id DESC LIMIT 0,1");

    if($latest_visit_type[0]['fcgid'] === '1') {

        $res = $db->qry("SELECT 'Out Patient' AS patient_type, p.name, p.city, p.age, p.father_name, p.gender, f.fcname, pc.amount AS total_package, pc.dr_id AS doctor_id, pv.p_visit_id, DATE_FORMAT(pv.visit_date, '%Y-%m-%d') AS visit_date, pv.visit_type, u.name AS dr_name, u.qualification  FROM patient_visit AS pv JOIN patient_info AS p ON pv.patient_id = '" . $_GET['patient_id'] . "' AND p.patient_id = pv.patient_id JOIN fecilities AS f ON f.fcid = pv.visit_type JOIN patient_consultation AS pc ON pc.p_visit_id = pv.p_visit_id JOIN user AS u ON u.uid = pc.dr_id ORDER BY pv.p_visit_id DESC LIMIT 0,1");

    } else {

        $res = $db->qry("SELECT 'In Patient' AS patient_type, p.patient_id, p.name, p.city, p.age, p.father_name, p.gender, pv.p_visit_id, DATE_FORMAT(pv.visit_date, '%Y-%m-%d') AS visit_date, pv.visit_type, f.fcname, ip.isBillSettled, ip.total_package_amount AS total_package, ip.incharge_doctor_id AS doctor_id, u.name AS dr_name, u.qualification FROM patient_visit AS pv JOIN patient_info AS p ON pv.patient_id = '" . $_GET['patient_id'] . "' AND p.patient_id = pv.patient_id JOIN fecilities AS f ON f.fcid = pv.visit_type JOIN Inpatient AS ip ON ip.p_visit_id = pv.p_visit_id JOIN user AS u ON u.uid = ip.incharge_doctor_id ORDER BY pv.p_visit_id DESC LIMIT 0,1");
    }

    echo json_encode($res);
}

if($_GET['action'] === 'get_paid_amount' && $_GET['p_visit_id'] !== '') {

    $res = $db->qry("SELECT IFNULL(sum(amount), 0) AS paid_amount FROM patient_transactions WHERE p_visit_id = '" . $_GET['p_visit_id'] . "'");
    echo json_encode($res);
}
if($_GET['action'] === 'get_latest_bill' && $_GET['transaction_id'] !== '') {

    $res = $db->qry("SELECT pt.amount, pt.receipt_no, DATE_FORMAT(pt.date_time, '%d-%m-%Y') AS date_time, p.name, p.city, p.mobile, b.bcname, u.name AS dr_name FROM patient_transactions AS pt JOIN patient_info AS p ON p.patient_id = pt.patient_id JOIN billcategory AS b ON b.bcid = pt.bcid JOIN user AS u ON u.uid = pt.doctor_id WHERE pt.transaction_id = '" . $_GET['transaction_id'] . "'");

    echo json_encode($res);
}

if($_GET['action'] === 'get_receipt_details' && $_GET['receipt_code'] !== '') {

    //$receipt_details = $db->qry("SELECT pt.receipt_code, pt.receipt_no, SUM(pt.amount) AS amount, DATE_FORMAT(pt.date_time, '%d-%m-%Y') AS date_time, p.name, p.city, p.mobile, b.bcname, u.name AS dr_name FROM patient_transactions AS pt JOIN patient_info AS p ON p.patient_id = pt.patient_id JOIN billcategory AS b ON b.bcid = pt.bcid JOIN user AS u ON u.uid = pt.doctor_id WHERE pt.receipt_code = '" . $_GET['receipt_code'] . "' GROUP BY pt.receipt_code");

    $receipt_details = get_receipt_details($_GET['receipt_code'], true, $db);

    echo json_encode($receipt_details);
}

if($_GET['action'] === 'get_receipt_details_for_dcr' && $_GET['receipt_code'] !== '') {

    if($_GET['patient_id'] !== 'null' && $_GET['patient_id'] !== '0') {

        $receipt_details = get_receipt_details($_GET['receipt_code'], true, $db);
    } else {

        $receipt_details = get_receipt_details($_GET['receipt_code'], false, $db);
    }

    echo json_encode($receipt_details);
}

if($_GET['action'] == 'cancel_receipt' && $_GET['receipt_code'] !== null && $_GET['user_id'] !== null) {

    $cancelled_date_time = date("Y-m-d H:i:s");

    $get_receipt_details = $db->qry("SELECT transaction_id, purpose_of_payment FROM patient_transactions WHERE receipt_code = '" . $_GET['receipt_code'] . "'");

    if($get_receipt_details[0]['purpose_of_payment'] === 'PHARMACY') {

        $get_pharma_details = $db->qry("SELECT medicine_stock_id, quantity FROM pharmacy_billing WHERE transaction_id = " . $get_receipt_details[0]['transaction_id']);

        foreach($get_pharma_details AS $ind_pharma) {

            $quantity = 0;
            $get_stock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE medicine_stock_id = " . $ind_pharma['medicine_stock_id']);

            $quantity = (int) $get_stock_reg[0]['quantity'];
            $quantity += (int) $ind_pharma['quantity'];

            $update_stock_reg = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $quantity . "' WHERE medicine_stock_id = '" . $ind_pharma['medicine_stock_id'] . "'");
        }
    }

    $update_res = $db->qry("UPDATE patient_transactions SET
                            receipt_status = '1',
                            cancelled_user_id = '" . $_GET['user_id'] . "',
                            cancelled_time = '" . $cancelled_date_time . "' WHERE receipt_code = '" . $_GET['receipt_code'] . "'");
    echo json_encode("Receipt Cancelled");
}

if($_GET['action'] === 'getOutpatientPaidDetails' && $_GET['visitId'] !== null) {
	
	$paidDetailsArray = array();
	$res = $db->qry("SELECT SUM(pt.amount) FROM patient_transactions AS pt WHERE pt.p_visit_id = " . $_GET['visitId'] . " AND pt.receipt_status = 0");
	
	
}

function get_receipt_details($receipt_code, $isPatient, $db) {

	if($isPatient) {
		$receipt_common_fields = $db->qry("SELECT 'true' AS patientInHospital, pt.patient_id, pt.hospital_id, pt.receipt_no, pt.receipt_code, SUM(pt.amount) AS amount, DATE_FORMAT(pt.date_time, '%d-%m-%Y') AS date_time, p.name, p.city, p.mobile, p.age, p.father_name, p.gender, b.bcname, u.name AS dr_name, u.qualification FROM patient_transactions AS pt JOIN patient_info AS p ON p.patient_id = pt.patient_id JOIN billcategory AS b ON b.bcid = pt.bcid JOIN user AS u ON u.uid = pt.doctor_id WHERE pt.receipt_code = '" . $receipt_code . "' GROUP BY pt.receipt_code");
	} else {
		$receipt_common_fields = $db->qry("SELECT 'false' AS patientInHospital, pt.hospital_id, pt.receipt_no, pt.receipt_code, SUM(pt.amount) AS amount, DATE_FORMAT(pt.date_time, '%d-%m-%Y') AS date_time, pt.patient_name, b.bcname, u.name AS dr_name, u.qualification FROM patient_transactions AS pt JOIN billcategory AS b ON b.bcid = pt.bcid JOIN user AS u ON u.uid = pt.doctor_id WHERE pt.receipt_code = '" . $receipt_code . "' GROUP BY pt.receipt_code");
	}

    //print_r($receipt_common_fields);

    $receipt_common_fields[0]['hospital_details'] = $db->qry("SELECT hname, haddress FROM hospitals WHERE hid = '" . $receipt_common_fields[0]['hospital_id'] . "'");

    if($receipt_common_fields[0]['bcname'] === 'LABS') {

        $receipt_common_fields[0]['paid_details'] = $db->qry("SELECT 'LABS' AS billcategory, tb.paid_amount AS amount, lt.test_name AS bcname FROM test_billing AS tb JOIN lab_test AS lt ON lt.lab_test_id = tb.test_id WHERE tb.receipt_code = '" . $receipt_code . "'");

    } else if($receipt_common_fields[0]['bcname'] === 'PHARMACY') {

        $receipt_common_fields[0]['paid_details'] = $db->qry("SELECT 'PHARMACY' AS billcategory, pb.paid_amount AS amount,pb.quantity, m.med_name AS bcname, m.med_id, msr.batch_no, msr.expiry_date FROM pharmacy_billing AS pb JOIN medicines AS m ON m.med_id = pb.medicine_id JOIN medicine_stock_register AS msr ON msr.medicine_stock_id = pb.medicine_stock_id WHERE pb.receipt_code = '" . $receipt_code . "'");

    } else {

        $receipt_common_fields[0]['paid_details'] = $db->qry("SELECT 'HOSPITAL' AS billcategory, pt.amount, b.bcname FROM patient_transactions AS pt JOIN billcategory AS b ON b.bcid = pt.bcid WHERE pt.receipt_code = '" . $receipt_code . "'");
    }

    return $receipt_common_fields;
}
