<?php
include_once("dbclass.php");
$db = new db();

if($_GET['action'] === 'dischargePatient') {

    extract($_POST);

    $dischargeDateTime = date("Y-m-d H:i:s", strtotime($dischargeDate));
    $dischargeDate = date("Y-m-d", strtotime($dischargeDate));

    $vacateBedOfVisit = $db->qry("UPDATE RoomAllotment SET 
                                    checkInOrCheckOut = 'checkOut', 
                                    vacatedDate = '" . $dischargeDate . "' WHERE patientId = " . $patientId . " AND visitId = " . $visitId . " AND checkInOrCheckOut = 'checkIn'");

    $dischargePatient = $db->qry("UPDATE Inpatient SET  
                                    discharge_date = '" . $dischargeDateTime . "',
                                    discharge_status = 1 WHERE patient_id = " . $patientId . " AND p_visit_id = " . $visitId);

    $updateDischargeSummary = $db->qry("UPDATE DischargeSummary SET 
                                            dischargeDate = '" . $dischargeDateTime . "',
                                            diagnosisTreatmentBy = '" . htmlentities($diagnosisTreatmentBy) . "',
                                            dischargeSummary = '" . htmlentities($dischargeSummary) . "',
                                            dischargeAdvise = '" . htmlentities($dischargeAdvise) . "',
                                            updatedUser = '" . $userId . "' WHERE patientId = " . $patientId . " AND visitId = " . $visitId);

    $getDischargeId = $db->qry("SELECT dischargeId FROM DischargeSummary WHERE patientId = " . $patientId . " AND visitId = " . $visitId);

    $dischargeId = $getDischargeId[0]['dischargeId'];
 
    if($_FILES['dischargeFiles']['name'] !== null && $_FILES['dischargeFiles']['name'] !== '') {
        
        $targetDirectory = "../uploads/dischargeFiles/";
        $actualFileName = basename($_FILES['dischargeFiles']['name']);
        $explodeFileName = explode(".", $actualFileName);
        $extensionOfFile = end($explodeFileName);
        $targetFileName = $dischargeId . "." . $extensionOfFile;

        if(move_uploaded_file($_FILES['dischargeFiles']['tmp_name'], $targetDirectory . $targetFileName)) {

            $updateDischargeSummaryFiles = $db->qry("UPDATE DischargeSummary SET dischargeFileName = '" . $targetFileName . "' WHERE dischargeId = " . $dischargeId);
        }
    }

    $getDischargeData = $db->qry("SELECT * FROM DischargeSummary WHERE dischargeId = " . $dischargeId);

    echo json_encode($getDischargeData);
}


if($_GET['action'] === 'addFinalSettlement') {

    extract($_POST);

    $finalBillDetails = array();
    foreach($roomDetailsOfVisit AS $roomDetail) {

        $finalBillDetailsCount = count($finalBillDetails);

        $finalBillDetails[$finalBillDetailsCount]['service_name'] = $roomDetail['loc_name'];
        $finalBillDetails[$finalBillDetailsCount]['no_of_days'] = $roomDetail['noOfDays'];
        $finalBillDetails[$finalBillDetailsCount]['amount'] = $roomDetail['roomRentAmount'];
    }

    foreach($doctorDetailsOfVisit AS $doctorDetail) {

        $finalBillDetailsCount = count($finalBillDetails);

        $finalBillDetails[$finalBillDetailsCount]['service_name'] = $doctorDetail['dr_name'];
        $finalBillDetails[$finalBillDetailsCount]['no_of_days'] = $doctorDetail['count'];
        $finalBillDetails[$finalBillDetailsCount]['amount'] = $doctorDetail['amount'];
    }

    $finalBillDetailsCount = count($finalBillDetails);
    $finalBillDetails[$finalBillDetailsCount]['service_name'] = 'Labs';
    $finalBillDetails[$finalBillDetailsCount]['no_of_days'] = null;
    $finalBillDetails[$finalBillDetailsCount]['amount'] = $investigationChargeOfVisit;

    $dischargePatient = $db->qry("UPDATE Inpatient SET 
                                    isBillSettled = 1 WHERE patient_id = " . $patientId . " AND p_visit_id = " . $visitId);

    $insertDischargeSummary = $db->qry("INSERT INTO DischargeSummary SET 
                                            patientId = '" . $patientId . "',
                                            visitId = '" . $visitId . "',
                                            finalBillDetails = '" . json_encode($finalBillDetails) . "',
                                            discount = '" . $discountAmountOfVisit . "',
                                            createdUser = '" . $userId . "',
                                            updatedUser = '" . $userId . "'");

    echo json_encode($insertDischargeSummary);
}

?>