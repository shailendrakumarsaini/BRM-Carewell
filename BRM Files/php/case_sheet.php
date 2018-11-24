<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action'] === 'add_dr_details') {
    extract($_POST);
    //print_r($_POST);

    $investigationResults = $casesheet['inv_details'];
    $investigationResults[0]['resultGiven'] = false;

    $ins_consult_dr = $db->qry("INSERT INTO CaseSheet SET 
                                    patientId = " . $casesheet['patient_id'] . ",
                                    visitId = " . $casesheet['p_visit_id'] . ",
                                    bedId = " . $casesheet['bed_id'] . ",
                                    date = '" . date("Y-m-d", strtotime($casesheet['date'])) . "',
                                    visitedDoctor = " . $casesheet['doctor_id'] . ",
                                    consultationType = '" . $casesheet['consultation_id'] . "',
                                    diagnosis = '" . $casesheet['diagnosis'] . "',
                                    notes = '" . $casesheet['notes'] . "',
                                    investigationsPerformed = '" . json_encode($casesheet['inv_details']) . "',
                                    investigationResults = '" . json_encode($investigationResults) . "',
                                    createdUser = '" . $casesheet['user_id'] . "',
                                    updatedUser = '" . $casesheet['user_id'] . "',
                                    prescribedMedication = '" . json_encode($casesheet['medication_details']) . "'");
    echo json_encode($ins_consult_dr);
}


if($_GET['action'] === 'update_doctor_visits') {
    extract($_POST);
    $upd_dr_visits = $db->qry("UPDATE CaseSheet SET 
                                    date = '" . date("Y-m-d", strtotime($updatedDoctorVisits['date'])) . "',
                                    visitedDoctor = " . $updatedDoctorVisits['visitedDoctor'] . ",
                                    updatedUser = '" . $updatedDoctorVisits['user_id'] . "',
                                    consultationType = '" . $updatedDoctorVisits['consultationType'] . "' WHERE caseSheetId = " . $updatedDoctorVisits['caseSheetId']);
    echo json_encode($upd_dr_visits);
}

if($_GET['action'] === 'update_investigations_for_caseSheet') {
    extract($_POST);

    $investigationResults = $updatedInvestigations['inv_details'];
    $investigationResults[0]['resultGiven'] = false;

    $upd_investigations = $db->qry("UPDATE CaseSheet SET 
                                    updatedUser = '" . $updatedInvestigations['user_id'] . "',
                                    investigationsPerformed = '" . json_encode($updatedInvestigations['inv_details']) . "',
                                    investigationResults = '" . json_encode($investigationResults) . "' WHERE caseSheetId = " . $updatedInvestigations['caseSheetId']);
           
    echo json_encode($upd_investigations);
}


if($_GET['action'] === 'update_investigations') {
    extract($_POST);
    //print_r($_POST);

    $investigationResults['investigationResults'][0]['resultGiven'] = true;
    //print_r($investigationResults);

    $upd_investigations = $db->qry("UPDATE CaseSheet SET 
                                    updatedUser = '" . $investigationResults['user_id'] . "',
                                    investigationResults = '" . json_encode($investigationResults['investigationResults']) . "' WHERE caseSheetId = " . $investigationResults['caseSheetId']);
           
    echo json_encode($upd_investigations);
}

if($_GET['action'] === 'update_prescriptions') {

    extract($_POST);
    $upd_prescriptions = $db->qry("UPDATE CaseSheet SET 
                                    updatedUser = '" . $updatedPrescriptions['user_id'] . "',
                                    prescribedMedication = '" . json_encode($updatedPrescriptions['medication_details']) . "' WHERE caseSheetId = " . $updatedPrescriptions['caseSheetId']);
                                
    echo json_encode($upd_prescriptions);   
}

if($_GET['action'] === 'update_others') {

    extract($_POST);
    $upd_others = $db->qry("UPDATE CaseSheet SET 
                                    updatedUser = '" . $updatedOthers['user_id'] . "',
                                    diagnosis = '" . $updatedOthers['diagnosis'] . "',
                                    notes = '" . $updatedOthers['notes'] . "' WHERE caseSheetId = " . $updatedOthers['caseSheetId']);
                                
    echo json_encode($upd_others);
}

if($_GET['action'] === 'get_previous_counsult_details' && $_GET['visit_id'] !== null) {

    $get_previous_consult = $db->qry("SELECT c.caseSheetId, c.patientId, c.date, c.visitedDoctor, u.name AS dr_name, u.qualification, c.consultationType, c.diagnosis, c.investigationsPerformed AS inv_details, c.investigationResults, c.prescribedMedication AS medication_details, c.monitoring, c.notes, p.gender, p.age, f.fcname FROM CaseSheet AS c JOIN user AS u ON u.uid = c.visitedDoctor JOIN patient_info AS p ON p.patient_id = c.patientId JOIN Dr_consultation AS dc ON dc.dr_consult_id = c.consultationType JOIN fecilities AS f ON f.fcid = dc.fcid WHERE visitId = " . $_GET['visit_id']);
    
    echo json_encode($get_previous_consult);
}

if($_GET['action'] === 'get_previous_counsult_detailss' && $_GET['visit_id'] !== null) {

    $get_previous_consult = $db->qry("SELECT c.caseSheetId, c.patientId, c.date, c.visitedDoctor, u.name AS dr_name, u.qualification, c.consultationType, c.diagnosis, c.investigationsPerformed AS inv_details, c.prescribedMedication AS medication_details, c.monitoring, c.notes FROM CaseSheet AS c JOIN user AS u ON u.uid = c.visitedDoctor WHERE visitId = " . $_GET['visit_id']);

    /*$get_previous_consult = $db->qry("SELECT c.caseSheetId, c.patientId, c.date, c.visitedDoctor, u.name AS dr_name, c.consultationType, c.diagnosis, c.investigationsPerformed AS inv_details, c.prescribedMedication AS medication_details, c.monitoring, c.notes, IF(c.investigationsPerformed, 'true', 'false') AS test_exist FROM CaseSheet AS c JOIN user AS u ON u.uid = c.visitedDoctor WHERE visitId = " . $_GET['visit_id']);*/

    echo json_encode($get_previous_consult);
}

if($_GET['action'] === 'get_previous_counsult_detailsss' && $_GET['visit_id'] !== null) {

    $get_previous_consult = $db->qry("SELECT c.caseSheetId, c.patientId, c.date, c.visitedDoctor, u.name AS dr_name,
u.qualification, c.consultationType, c.diagnosis, c.investigationsPerformed AS inv_details, c.prescribedMedication AS medication_details, c.monitoring, c.notes FROM CaseSheet AS c JOIN user AS u ON u.uid = c.visitedDoctor WHERE visitId = " . $_GET['visit_id']);

    $inv_details = json_decode($get_previous_consult[0]['inv_details']);

    foreach($inv_details AS $key => $inv_detail) {
        $get_test_name = $db->qry("SELECT test_name FROM lab_test WHERE lab_test_id = " . $inv_detail['test_id']);
        $inv_details[$key]['test_name'] = $get_test_name[0]['test_name'];
    }

    echo '<pre>', print_r($inv_details), '</pre>';
    echo json_encode($get_previous_consult);
}

if($_GET['action'] === 'all_casesheet_data') {

    $date = date("Y-m-d");

    //$get_all_cash_sheet = $db->qry("SELECT c.caseSheetId, c.patientId, p.name, c.date, c.visitedDoctor, u.name AS dr_name, u.qualification, c.consultationType, c.diagnosis, c.investigationsPerformed AS inv_details, c.prescribedMedication AS medication_details, c.monitoring, c.notes, c.investigationResults FROM CaseSheet AS c LEFT JOIN user AS u ON u.uid = c.visitedDoctor JOIN patient_info AS p ON p.patient_id = c.patientId WHERE c.date = '" . $date . "'");

    $get_all_cash_sheet = $db->qry("SELECT c.caseSheetId, c.patientId, p.name, c.date, c.visitedDoctor, u.name AS dr_name, u.qualification, c.consultationType, c.diagnosis, c.investigationsPerformed AS inv_details, c.prescribedMedication AS medication_details, c.monitoring, c.notes, c.investigationResults FROM CaseSheet AS c LEFT JOIN user AS u ON u.uid = c.visitedDoctor JOIN patient_info AS p ON p.patient_id = c.patientId");

    echo json_encode($get_all_cash_sheet);
}


if($_GET['action'] === 'specific_date_cs' && $_GET['from_date'] !== null && $_GET['to_date'] !== null) {

	$from_date = date("Y-m-d", strtotime($_GET['from_date']));
	$to_date = date("Y-m-d", strtotime($_GET['to_date']));
	
    $get_all_cash_sheet = $db->qry("SELECT c.caseSheetId, c.patientId, p.name, c.date, c.visitedDoctor, u.name AS dr_name, u.qualification, c.consultationType, c.diagnosis, c.investigationsPerformed AS inv_details, c.prescribedMedication AS medication_details, c.monitoring, c.notes, c.investigationResults FROM CaseSheet AS c LEFT JOIN user AS u ON u.uid = c.visitedDoctor JOIN patient_info AS p ON p.patient_id = c.patientId WHERE c.date BETWEEN '" . $from_date . "' AND '" . $to_date . "' ORDER BY c.caseSheetId DESC");

    echo json_encode($get_all_cash_sheet);
}



if($_GET['action'] === 'get_prescriptions_list_for_visit' && $_GET['visit_id'] !== null) {

    $get_prescriptions = $db->qry("SELECT c.prescribedMedication, c.date, u.name AS dr_name, u.qualification FROM CaseSheet AS c JOIN user AS u ON u.uid = c.visitedDoctor WHERE c.visitId = " . $_GET['visit_id']);
    echo json_encode($get_prescriptions);
}

if($_GET['action'] === 'get_investigations_list_for_visit' && $_GET['visit_id'] !== null) {

    $get_prescriptions = $db->qry("SELECT c.investigationsPerformed, c.date, u.name AS dr_name, u.qualification FROM CaseSheet AS c JOIN user AS u ON u.uid = c.visitedDoctor WHERE c.visitId = " . $_GET['visit_id']);
    echo json_encode($get_prescriptions);
}


if($_GET['action'] === 'getTestDetailsOfCaseSheet' && $_GET['caseSheetId'] !== null) {

    $res = $db->qry("SELECT cs.caseSheetId, cs.investigationsPerformed AS inv_details, cs.investigationResults, cs.date, p.name, p.age, p.father_name, p.city, p.gender, p.mobile, u.name AS dr_name, u.qualification FROM CaseSheet AS cs JOIN patient_info AS p ON p.patient_id = cs.patientId JOIN user AS u ON u.uid = cs.visitedDoctor WHERE cs.caseSheetId = " . $_GET['caseSheetId']);
   
    $res[0]['inv_details'] = json_decode($res[0]['inv_details']);
    $res[0]['investigationResults'] = json_decode($res[0]['investigationResults']);

    echo json_encode($res);
}

?>