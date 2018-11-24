<?php

include_once("dbclass.php");
$db = new db();

if ($_GET["action"] === "consultation_rooms") {
    //Get consultation room details.
    
	$consultation_rooms_obj = array();

	$today_date = date("Y-m-d H:i:s", strtotime(date("d-m-Y")));

	/* $get_consultation_rooms = $db->qry("SELECT DISTINCT room_id FROM consultation_rooms");

	$c_index = 0;
	foreach ($get_consultation_rooms AS $consultation_room) {

		$get_doctors_under_room = $db->qry("SELECT dr_id FROM consultation_rooms WHERE room_id = '" . $consultation_room['room_id'] . "'");
		$get_room_name = $db->qry("SELECT loc_name FROM locations WHERE loc_id = '" . $consultation_room['room_id'] . "'");

		foreach ($get_doctors_under_room AS $doctor_obj) {

			$doctor_id_array[] = $doctor_obj["dr_id"];
		}

		$doctor_ids = implode("','", $doctor_id_array);
		unset($doctor_id_array);

		$count_of_patients_of_drs = $db->qry("SELECT COUNT(pc.patient_id) AS patient_count, pc.dr_id, u.name, u.qualification FROM patient_consultation AS pc JOIN user AS u ON u.uid = pc.dr_id AND pc.dr_id IN ('" . $doctor_ids . "') AND pc.datetime BETWEEN '" . $today_date . "' AND DATE_ADD('" . $today_date . "', INTERVAL 1 DAY) GROUP BY pc.dr_id");

		if (gettype($count_of_patients_of_drs) === 'array') {

			foreach ($count_of_patients_of_drs AS $p_index => $count_of_patients_of_dr) {

				$consultation_rooms_obj["consulatation_rooms"][$c_index]["patients_count_of_dr"][$p_index]["dr_name"] = $count_of_patients_of_dr['name'];
				$consultation_rooms_obj["consulatation_rooms"][$c_index]["patients_count_of_dr"][$p_index]["qualification"] = $count_of_patients_of_dr['qualification'];
				$consultation_rooms_obj["consulatation_rooms"][$c_index]["patients_count_of_dr"][$p_index]["patient_count"] = $count_of_patients_of_dr['patient_count'];
				
				if ($p_index === 0) {
                    
					$consultation_rooms_obj["consulatation_rooms"][$c_index]["location_name"] = $get_room_name[0]['loc_name'];
				}
			}

			$c_index++;
		}
    } */
    
    $count_of_patients_of_drs = $db->qry("SELECT COUNT(pc.patient_id) AS patient_count, pc.dr_id, u.name AS dr_name, u.qualification FROM patient_consultation AS pc JOIN user AS u ON u.uid = pc.dr_id AND pc.datetime BETWEEN '" . $today_date . "' AND DATE_ADD('" . $today_date . "', INTERVAL 1 DAY) GROUP BY pc.dr_id");

    echo json_encode($count_of_patients_of_drs);
}

if ($_GET["action"] === "outpatient_count") {
    //Get outpatient count.

    $today_date = date("Y-m-d H:i:s", strtotime(date("d-m-Y")));

    $count_of_out_patients = $db->qry("SELECT COUNT(pc.patient_id) AS patient_count FROM patient_consultation AS pc WHERE pc.datetime BETWEEN '" . $today_date . "' AND DATE_ADD('" . $today_date . "', INTERVAL 1 DAY)");

    echo json_encode($count_of_out_patients);
}

?>