<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action'] === 'all') {
//retrieving the schemes data
    $get_data = $db->qry("SELECT * FROM HealthSchemes");
    
    echo json_encode($get_data);
}

if($_GET['action'] === 'add') {
	//Inserting the scheme data
	extract($_POST);
	//print_r($_POST);
    $add_scheme = $db->qry("INSERT INTO HealthSchemes SET 
                           	schemeName = '" . $scheme['scheme_name'] . "',
							cashlessOrReimbursement = '" . 	$scheme['paid_type'] . "',
							govtOrInsurance = '" . 	$scheme['scheme_type'] . "',
							createdUser = '" . 	$scheme['user_id'] . "',
							updatedUser = '" . 	$scheme['user_id'] . "'");
    echo json_encode($add_scheme);
}

if($_GET['action'] === 'update') {
	//updating the scheme data
	extract($_POST);
    $upd_scheme = $db->qry("UPDATE HealthSchemes SET 
							schemeName = '" . $scheme['schemeName'] . "',
							cashlessOrReimbursement = '" . 	$scheme['cashlessOrReimbursement'] . "',
							govtOrInsurance = '" . 	$scheme['govtOrInsurance'] . "',
							updatedUser = '" . 	$scheme['user_id'] . "' 
							WHERE schemeId = '" . $scheme['schemeId'] . "'");
    
    echo json_encode($upd_scheme);
}