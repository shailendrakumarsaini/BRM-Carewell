<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action'] === 'get_specificedate_bill_register' && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {

    $from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
    $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));

    $get_today_bill_register = $db->qry("SELECT pt.patient_name, pt.patient_id, pt.p_visit_id, SUM(pt.amount) AS amount, pt.receipt_no, pt.receipt_code, DATE_FORMAT(pt.date_time, '%d-%m-%Y') AS date_time, DATE_FORMAT(pt.transaction_date, '%d-%m-%Y') AS transaction_date, pt.payment_type, pt.remarks, f.fcname, b.bcname, p.name, p.age, p.gender, p.father_name, u.name AS cashier_name FROM patient_transactions AS pt LEFT JOIN patient_visit AS pv ON pv.p_visit_id = pt.p_visit_id LEFT JOIN fecilities AS f ON f.fcid = pv.visit_type LEFT JOIN billcategory AS b ON b.bcid = pt.bcid LEFT JOIN patient_info AS p ON pt.patient_id = p.patient_id LEFT JOIN user AS u ON u.uid = pt.user_id WHERE pt.date_time BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pt.receipt_status = 0 GROUP BY pt.receipt_code ORDER BY pt.date_time DESC");

    echo json_encode($get_today_bill_register);
}


if($_GET['action'] === 'get_specificedate_cancelled_receipts' && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {

    $from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
    $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));

    $get_today_can_bill_register = $db->qry("SELECT pt.patient_name, pt.patient_id, pt.p_visit_id, SUM(pt.amount) AS amount, pt.receipt_no, pt.receipt_code, DATE_FORMAT(pt.date_time, '%d-%m-%Y') AS date_time, pt.payment_type, pt.remarks, f.fcname, b.bcname, p.name, p.age, p.gender, p.father_name, u.name AS cashier_name FROM patient_transactions AS pt LEFT JOIN patient_visit AS pv ON pv.p_visit_id = pt.p_visit_id LEFT JOIN fecilities AS f ON f.fcid = pv.visit_type LEFT JOIN billcategory AS b ON b.bcid = pt.bcid LEFT JOIN patient_info AS p ON pt.patient_id = p.patient_id LEFT JOIN user AS u ON u.uid = pt.user_id WHERE pt.date_time BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY) AND pt.receipt_status = 1 GROUP BY pt.receipt_code ORDER BY pt.cancelled_time DESC");

    echo json_encode($get_today_can_bill_register);
}


// if($_GET['action'] === 'get_payment_type_count_on_dates' && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {
    
//     $from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
//     $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));

//     $all_type_count_array = array();

//     $get_cash_type_count = $db->count("transaction_id", "patient_transactions", "WHERE payment_type LIKE('%cash%') AND date_time BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY)");

//     $get_card_type_count = $db->count("transaction_id", "patient_transactions", "WHERE payment_type LIKE('%card%') AND date_time BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY)");

//     $get_cheque_type_count = $db->count("transaction_id", "patient_transactions", "WHERE payment_type LIKE('%cheque%') AND date_time BETWEEN '" . $from_date_time . "' AND DATE_ADD('" . $to_date_time . "', INTERVAL 1 DAY)");

//     $all_type_count_array['cash'] = (int) $get_cash_type_count;
//     $all_type_count_array['card'] = (int) $get_card_type_count;
//     $all_type_count_array['cheque'] = (int) $get_cheque_type_count;

//     echo json_encode($all_type_count_array);
// }