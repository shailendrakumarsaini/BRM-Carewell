<?php
include_once("dbclass.php");
$db = new db();

if($_GET['action'] == 'add') {

    extract($_POST);

    foreach($doctorPayment['visits'] AS $visit) {

        if($visit['doctorPayment'] !== '' && $visit['doctorPayment'] !== null && $visit['isPaid'] !== '1') {

            $adddoctorPayment = $db->qry("INSERT INTO DoctorPayment SET 
                                                PId = " . $visit['patient_id'] . ",
                                                VId = " . $visit['p_visit_id'] . ",
                                                DId = " . $visit['visitedDoctor'] . ",
                                                AmountReceived = '" . $visit['packageAmount'] . "',
                                                doctorPayment = '" . $visit['doctorPayment'] . "',
                                                isPaid = '1',
                                                dateOfPayment = '" . date("Y-m-d", strtotime($doctorPayment['paymentDate'])) . "',
                                                paymentThrough = '" . $doctorPayment['paymentThrough'] . "',
                                                paymentType = '" . $doctorPayment['paymentType'] . "',
                                                paymentDetails = '" . $doctorPayment['paymentDetails'] . "',
                                                createdBy = '" . $doctorPayment['userId'] . "',
                                                updatedBy = '" . $doctorPayment['userId'] . "'");
        }
    }

    echo json_encode($adddoctorPayment);
}

?>