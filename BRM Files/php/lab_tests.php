<?php
include_once("dbclass.php");
$db = new db();

if ($_GET["action"] === "get_test_data") {
    //Get all details of lab tests.
    $test_group_data = $db->qry("SELECT * FROM lab_test AS lt JOIN lab_test_groups AS ltg ON ltg.test_group_id = lt.test_group_id");
    echo json_encode($test_group_data); 
}


if ($_GET["action"] === "get_unpriced_tests") {
    //Get all details of lab tests.
    $get_priced_tests = $db->qry("SELECT test_id FROM test_pricing");
    if(gettype($get_priced_tests) === 'array') {
        foreach($get_priced_tests AS $test) {
            $priced_tests_array[] = $test['test_id'];
        }
        $priced_test_ids = implode("','", $priced_tests_array);
    } else {
        $priced_test_ids = 0;
    }
    $test_group_data = $db->qry("SELECT lt.lab_test_id, lt.test_name FROM lab_test AS lt JOIN lab_test_groups AS ltg ON ltg.test_group_id = lt.test_group_id WHERE lt.lab_test_id NOT IN('" . $priced_test_ids . "')");
    echo json_encode($test_group_data);
}


//Get fecility id of lab and mri scanning test

if($_GET['action'] === 'get_test_services') {

    /* $get_facility_ids = $db->qry("SELECT fcgid FROM fecilities_group WHERE fcgname = 'Laboratory Diagnosis' OR 'Scanning or Imaging'");
    
    if(gettype($get_facility_ids) === 'array') {
        foreach($get_facility_ids AS $facility) {
            $facility_ids_array[] = $facility['fcgid'];
        }
        $facility_ids = implode("','", $facility_ids_array);
    } else {
        $facility_ids = 0;
    }

    echo $facility_ids; 
    $priced_test_ids = implode("','", $priced_tests_array);*/
    $res = $db->qry("SELECT fcgid, fcgname FROM fecilities_group WHERE fcgid IN('2', '3')");
    echo json_encode($res);
}


if ($_GET["action"] === "specific_test_data" && $_GET['lab_test_id'] !== '') {
    //Get all details of lab tests.
    $test_group_data = $db->qry("SELECT * FROM lab_test AS lt JOIN lab_test_groups AS ltg ON lt.lab_test_id = '" . $_GET['lab_test_id'] . "' AND ltg.test_group_id = lt.test_group_id ");
    echo json_encode($test_group_data);
}


if ($_GET["action"] === "get_test_group_data") {
    //Get all details of lab test groups.
    $test_group_data = $db->qry("SELECT * FROM lab_test_groups");
    echo json_encode($test_group_data);
}


if ($_GET["action"] === "add_test_group") {
    //Add test group.
    extract($_POST);
    $add_test_group = $db->qry("INSERT INTO lab_test_groups SET 
                                    test_group_name = '" . $test_group_name . "'");
    echo json_encode($add_test_group);
}


if($_GET["action"] === "add_test") {
   //Add test.
    extract($_POST);
    $add_tests = $db->qry("INSERT INTO lab_test SET 
                                test_group_id = '" . $lab_test['test_group_id'] . "',
                                test_service_id = '" . $lab_test['test_service_id'] . "',
                                test_name = '" . $lab_test['test_name'] . "',
                                ref_values = '" . json_encode($lab_test['input_values']) . "',
                                sample_name = '" . json_encode($lab_test['input_samples']) . "',
                                consumable_items = '" . json_encode($lab_test['input_consumables']) . "'");
    echo json_encode($add_tests);
}

if($_GET["action"] === "update_test"){
	//update test
	extract($_POST);
    //print_r($_POST);

	$update = $db->qry("UPDATE lab_test SET 
                                test_group_id = '" . $update_lab_test['test_group_id'] . "',
                                test_service_id = '" . $update_lab_test['test_service_id'] . "',
                                test_name = '" . $update_lab_test['test_name'] . "',
                                ref_values = '" . json_encode($update_lab_test['input_values']) . "',
                                sample_name = '" . json_encode($update_lab_test['input_samples']) . "',
                                consumable_items = '" . json_encode($update_lab_test['input_consumables']) . "' WHERE lab_test_id = '" . $update_lab_test['test_id'] . "'");			
	echo json_encode($update);
	
}

if($_GET["action"] === "delete_test" AND $_GET['lab_test_id'] !== ''){
	
	$delete = $db->qry("DELETE FROM lab_test WHERE lab_test_id = '" . $_GET['lab_test_id'] . "' ");
}


if($_GET['action'] === 'get_patient_investigation_data' && $_GET['CaseSheetId'] !== null) {

    $final_array = array();
	
    $res = $db->qry("SELECT * FROM CaseSheet AS cs WHERE cs.CaseSheetId = " . $_GET['CaseSheetId']);
    //$res = $db->qry("SELECT JSON_EXTRACT(JSON_EXTRACT(cs.investigationsPerformed, '$[1]'), '$.test_id') AS test_id from medwise.CaseSheet as cs");
    
    $res[0]['investigationsPerformed'] = json_decode($res[0]['investigationsPerformed']);
    
    foreach($res[0]['investigationsPerformed'] AS $investigations) {
        
        $get_test_values = $db->qry("SELECT ref_values FROM lab_test WHERE lab_test_id = " . $investigations->test_id);
        $investigations->ref_values = $get_test_values[0]['ref_values'];
    }

    echo '<pre>', print_r($res), '</pre>';
    //echo json_encode($res);
}

?>