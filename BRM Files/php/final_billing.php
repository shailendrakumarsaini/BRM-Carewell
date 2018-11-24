<?php
include_once("dbclass.php");
$db = new db();

if($_GET['action'] === 'getRoomDetailsOfVisit' && $_GET['visitId'] !== null) {

    //$getRoomDetailsOfVisit = $db->qry("SELECT ra.bedId, ra.enteredDate, IFNULL(ra.vacatedDate, CURDATE()) AS vacatedDate, ra.roomRentAmount, b.bed_code, l.loc_name, l.block_name, true AS includeIt, IF(DATEDIFF(IFNULL(ra.vacatedDate, CURDATE()), ra.enteredDate) = 0, 1, DATEDIFF(IFNULL(ra.vacatedDate, CURDATE()), ra.enteredDate)) AS noOfDays FROM RoomAllotment AS ra JOIN bed_master AS b ON b.bed_id = ra.bedId JOIN locations AS l ON l.loc_id = b.bed_loc_id WHERE ra.visitId = " . $_GET['visitId']);

    $getRoomDetailsOfVisit = $db->qry("SELECT ra.bedId, ra.enteredDate, ra.vacatedDate, ra.roomRentAmount, b.bed_code, l.loc_name, l.block_name, true AS includeIt, IF(DATEDIFF(ra.vacatedDate, ra.enteredDate) = 0, 1, DATEDIFF(ra.vacatedDate, ra.enteredDate)) AS noOfDays FROM RoomAllotment AS ra JOIN bed_master AS b ON b.bed_id = ra.bedId JOIN locations AS l ON l.loc_id = b.bed_loc_id WHERE ra.visitId = " . $_GET['visitId']);

    echo json_encode($getRoomDetailsOfVisit);
}


if($_GET['action'] === 'getAllDoctorDetailsOfVisit' && $_GET['visitId'] !== null) {

    $getAllDoctorDetailsOfVisit = $db->qry("SELECT cs.visitedDoctor, cs.consultationType, cs.date, u.name AS dr_name, u.qualification, dc.amount FROM CaseSheet AS cs JOIN user AS u ON u.uid = cs.visitedDoctor JOIN Dr_consultation AS dc ON dc.dr_consult_id = cs.consultationType WHERE cs.visitId = " . $_GET['visitId']);

    echo json_encode($getAllDoctorDetailsOfVisit);
}

if($_GET['action'] === 'getLabTestsOfVisit' && $_GET['visitId'] !== null) {

    $getLabTestsOfVisit = $db->qry("SELECT cs.investigationsPerformed FROM CaseSheet AS cs WHERE cs.visitId = " . $_GET['visitId']);
    echo json_encode($getLabTestsOfVisit);
}

if($_GET['action'] === 'getPaidDetailsOfVisit' && $_GET['visitId'] !== null) {

    $getPaidDetailsOfVisit = $db->qry("SELECT pt.amount, pt.receipt_code FROM patient_transactions AS pt WHERE pt.p_visit_id = " . $_GET['visitId'] . " AND pt.bcid <> 1 GROUP BY pt.bcid");
    echo json_encode($getPaidDetailsOfVisit);
}
?>