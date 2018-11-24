<?php
include_once("dbclass.php");
$db = new db();

if($_GET['action'] == 'add') {

    extract($_POST);
    //print_r($_POST);
    
    foreach($referralPayment['visits'] AS $visit) {

        if($visit['referralPayment'] !== '' && $visit['referralPayment'] !== null && $visit['isPaid'] !== '1') {

            $addReferralPayment = $db->qry("INSERT INTO ReferralPayment SET 
                                                PId = " . $visit['patient_id'] . ",
                                                VId = " . $visit['p_visit_id'] . ",
                                                RId = " . $visit['ref_id'] . ",
                                                AmountReceived = '" . $visit['packageAmount'] . "',
                                                referralPayment = '" . $visit['referralPayment'] . "',
                                                isPaid = '1',
                                                dateOfPayment = '" . date("Y-m-d", strtotime($referralPayment['paymentDate'])) . "',
                                                paymentThrough = '" . $referralPayment['paymentThrough'] . "',
                                                paymentType = '" . $referralPayment['paymentType'] . "',
                                                paymentDetails = '" . $referralPayment['paymentDetails'] . "',
                                                createdBy = '" . $referralPayment['userId'] . "',
                                                updatedBy = '" . $referralPayment['userId'] . "'");
        }
    }

    echo json_encode($addReferralPayment);
}

?>