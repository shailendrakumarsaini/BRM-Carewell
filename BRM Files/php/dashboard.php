<?php
include_once("dbclass.php");
$db = new db();

if($_GET['action'] === 'get_total_income') {
	
	//Get the total income of patient
    $today_date = date("Y-m-d H:i:s", strtotime(date("Y-m-d")));

    $res = $db->qry("SELECT sum(amount) AS total_income FROM patient_transactions WHERE receipt_status = 0 AND date_time BETWEEN '" . $today_date . "' AND DATE_ADD('" . $today_date . "', INTERVAL 1 DAY)");

    echo json_encode($res);
}

if($_GET['action'] === 'get_individual_income') {

	//Get the individual income of patient
    $today_date = date("Y-m-d H:i:s", strtotime(date("Y-m-d")));

    $ind_inc_array = array();
    $ind_inc_array[0]['bcgroup'] = 'Hospital';
    $ind_inc_array[0]['ind_income'] = '0';
    $ind_inc_array[1]['bcgroup'] = 'Labs';
    $ind_inc_array[1]['ind_income'] = '0';
    $ind_inc_array[2]['bcgroup'] = 'Pharmacy';
    $ind_inc_array[2]['ind_income'] = '0';

    $res = $db->qry("SELECT IFNULL(sum(pt.amount), 0) AS ind_income, b.bcgroup FROM patient_transactions AS pt JOIN billcategory AS b ON b.bcid = pt.bcid WHERE pt.receipt_status = 0 AND date_time BETWEEN '" . $today_date . "' AND DATE_ADD('" . $today_date . "', INTERVAL 1 DAY) GROUP BY b.bcgroup");

    if(gettype($res) !== 'object') {
        foreach($res AS $ind_res) {
            if ($ind_res['bcgroup'] === 'Hospital') {
                $ind_inc_array[0]['ind_income'] = $ind_res['ind_income'];
            } else if($ind_res['bcgroup'] === 'Labs') {
                $ind_inc_array[1]['ind_income'] = $ind_res['ind_income'];
            } else if($ind_res['bcgroup'] === 'Pharmacy') {
                $ind_inc_array[2]['ind_income'] = $ind_res['ind_income'];
            }
        }
    }
    echo json_encode($ind_inc_array);
}

if($_GET['action'] === 'get_inpatient_count_by_scheme_wise') {
	
 //get the inpatient count with scheme wise
 
    $rec = $db->qry("SELECT count(Ip.patient_id) AS inpatient_count, hs.schemeName, Ip.scheme_id FROM Inpatient AS Ip JOIN HealthSchemes AS hs ON hs.schemeId = Ip.scheme_id WHERE Ip.discharge_status = '0' GROUP BY Ip.scheme_id");
	echo json_encode($rec);
}

if($_GET['action'] === 'get_patient_details_by_scheme_wise' && $_GET['scheme_id'] !== null) {

//get the patient details with scheme wise

    $rec = $db->qry("SELECT p.patient_id, p.name, p.age, p.gender, p.father_name, DATE_FORMAT(pv.visit_date, '%Y-%m-%d') AS visit_date, hs.schemeName, Ip.scheme_id, u.name AS dr_name, u.qualification FROM Inpatient AS Ip JOIN HealthSchemes AS hs ON hs.schemeId = Ip.scheme_id JOIN patient_visit AS pv ON pv.p_visit_id = Ip.p_visit_id JOIN patient_info AS p ON p.patient_id = Ip.patient_id JOIN user AS u ON u.uid = Ip.incharge_doctor_id WHERE Ip.scheme_id = " . $_GET['scheme_id'] . " AND Ip.discharge_status = '0'");
	echo json_encode($rec);
}

if($_GET['action'] === "income") {

    $res = $db->qry("select pt.patient_id, pt.amount, pt.purpose_of_payment, pi.name, pi.age, pi.gender, pi.city, pi.father_name from medwise.patient_transactions as pt left join medwise.patient_info as pi on pt.patient_id = pi.patient_id where date_format(transaction_date, '%Y-%m-%d') = date_format(current_date(), '%Y-%m-%d') and receipt_status = 0 order by pt.patient_id");

    echo json_encode($res);
}

if($_GET['action'] === "expenditure") {
 //expenditure of particular on particular bill
    $res = $db->qry("select ec.expCatName, p.individualOrCompany, p.receivedBy, p.receivedUserId, p.purpose, p.amount from medwise.Payments as p left join medwise.ExpenditureCategories as ec on p.expCatId = ec.expCatId where date_format(p.updatedAt, '%Y-%m-%d') = date_format(current_date(), '%Y-%m-%d') and p.pay_status = 1 and p.canceledStatus = 1 order by p.purpose");

    echo json_encode($res);
}

if($_GET['action'] === "get_test_count_of_op_patients") {
    //test count of outpatient
    $get_visit_id_of_op = $db->qry("SELECT fcid FROM fecilities WHERE fcname='OP Consultation'");
    $get_visit_id_of_ip = $db->qry("SELECT fcid FROM fecilities WHERE fcname='IP Consultation'");

    $get_lab_id = $db->qry("SELECT bcid FROM billcategory WHERE bcname='LABS'");

    $get_op_test_count = $db->qry("SELECT count(tb.test_billing_id) AS op_test_count, IFNULL(SUM(tb.paid_amount), 0) AS total_amount FROM patient_transactions AS pt JOIN patient_visit AS pv ON pv.p_visit_id = pt.p_visit_id JOIN test_billing AS tb ON tb.transaction_id = pt.transaction_id WHERE pt.receipt_status = 0 AND pv.visit_type = " . $get_visit_id_of_op[0]['fcid'] . " AND pt.bcid = " . $get_lab_id[0]['bcid']);

    $get_ip_test_count = $db->qry("SELECT count(tb.test_billing_id) AS ip_test_count, IFNULL(SUM(tb.paid_amount), 0) AS total_amount FROM patient_transactions AS pt JOIN patient_visit AS pv ON pv.p_visit_id = pt.p_visit_id JOIN test_billing AS tb ON tb.transaction_id = pt.transaction_id WHERE pt.receipt_status = 0 AND pv.visit_type = " . $get_visit_id_of_ip[0]['fcid'] . " AND pt.bcid = " . $get_lab_id[0]['bcid']);

    $final_array['op_test_count'] = $get_op_test_count[0]['op_test_count'];
    $final_array['ip_test_count'] = $get_ip_test_count[0]['ip_test_count'];
    $final_array['total_amount'] = (double) $get_op_test_count[0]['total_amount'] + (double) $get_ip_test_count[0]['total_amount'];
    echo json_encode($final_array);
}

if($_GET['action'] === "get_pharmacy_amount") {
 //Get pharmacy amount
    $get_results = $db->qry("SELECT IFNULL(SUM(pb.paid_amount), 0) AS sale_price, IFNULL(SUM(pb.purchase_price * pb.quantity), 0) AS purchase_price FROM patient_transactions AS pt JOIN patient_visit AS pv ON pv.p_visit_id = pt.p_visit_id JOIN pharmacy_billing AS pb ON pb.transaction_id = pt.transaction_id WHERE pt.receipt_status = 0");

    $get_expired_medicines_count = $db->qry("SELECT IFNULL(SUM(quantity), 0) AS drugs_to_be_expired FROM medicine_stock_register WHERE expiry_date <= DATE_ADD(CURDATE(), INTERVAL 1 MONTH)");

    $final_array['drugs_to_be_expired'] = $get_expired_medicines_count[0]['drugs_to_be_expired'];
    $final_array['sale_price'] = $get_results[0]['sale_price'];
    $final_array['purchase_price'] = $get_results[0]['purchase_price'];
    echo json_encode($final_array);
}

/*if($_GET['action'] === 'get_inventory_count') {
    $get_inward_count = $db->qry("SELECT count(DISTINCT medicine_po_id) AS inward_count FROM medicine_inward_register WHERE received_date = CURDATE()");

    $get_outward_count = $db->qry("SELECT * FROM ");
}*/

?>