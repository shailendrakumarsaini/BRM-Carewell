<?php
include_once ("dbclass.php");
$db=new db();


if($_GET['action'] === 'change_room') {

    extract($_POST);

    $vacatedDate = date("Y-m-d", strtotime($roomChange['vacatedDate']));

    $updateRoomAllotment = $db->qry("UPDATE RoomAllotment SET 
                                        checkInOrCheckOut = 'checkOut',
                                        vacatedDate = '" . $vacatedDate . "',
                                        updatedUser = " . $roomChange['user_id'] . " WHERE visitId = " . $roomChange['visit_id'] . " AND patientId = " . $roomChange['patient_id'] . " AND checkInOrCheckOut = 'checkIn'");

    $insertRoomAllotment = $db->qry("INSERT INTO RoomAllotment SET 
                                        patientId = " . $roomChange['patient_id'] . ",
                                        visitId = " . $roomChange['visit_id'] . ",
                                        bedId = " . $roomChange['bed_id'] . ",
                                        roomRentAmount = " . $roomChange['rentAmount'] . ",
                                        checkInOrCheckOut = 'checkIn',
                                        enteredDate = '" . $vacatedDate . "',
                                        createdUser = " . $roomChange['user_id'] . ",
                                        updatedUser = " . $roomChange['user_id']);
    
    echo json_encode($insertRoomAllotment);
}

?>