<?php
include_once ("dbclass.php");
$db = new db();


if($_GET['action'] === 'get_all_transactions' && $_GET['visit_id'] !== null) {

    $get_bc_id = $db->qry("SELECT bcid FROM billcategory WHERE bcname = 'PHARMACY'");
    $bc_id = $get_bc_id[0]['bcid'];

    $res = $db->qry("SELECT pt.transaction_id, pt.purpose_of_payment, DATE_FORMAT(pt.date_time, '%Y-%m-%d') AS date_time, pt.amount FROM patient_transactions AS pt WHERE pt.p_visit_id = " . $_GET['visit_id'] . " AND pt.receipt_status = 0");

    echo json_encode($res);
}


if($_GET['action'] === 'get_pharmacy_loss_or_profit' && $_GET['visit_id'] !== null) {

    $get_bc_id = $db->qry("SELECT bcid FROM billcategory WHERE bcname = 'PHARMACY'");
    $bc_id = $get_bc_id[0]['bcid'];

    $res = $db->qry("SELECT pt.transaction_id, pt.amount FROM patient_transactions AS pt WHERE pt.p_visit_id = " . $_GET['visit_id'] . " AND bcid = " . $bc_id . " AND pt.receipt_status = 0");

    //echo '<pre>', print_r($res), '</pre>';
    $calc_array['actual_amount'] = 0;
    $calc_array['total_amount'] = 0;
    foreach($res AS $index => $ind_transaction) {

        $ph_res = $db->qry("SELECT IFNULL(SUM(quantity * purchase_price), 0) AS actual_amount FROM pharmacy_billing WHERE transaction_id = " . $ind_transaction['transaction_id']);

        $calc_array['actual_amount'] += (double) $ph_res[0]['actual_amount'];
        $calc_array['total_amount'] += (double) $ind_transaction['amount'];
    }

    echo json_encode($calc_array);
}

?>