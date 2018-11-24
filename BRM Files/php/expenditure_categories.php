<?php
include_once ("dbclass.php");
$db=new db();
/*retriving the data from the expenditure*/
if($_GET['action'] === 'all') {
    $get_data = $db->qry("SELECT * FROM ExpenditureCategories");   
    echo json_encode($get_data);
}

if($_GET['action'] === 'add') {
	//Inserting the data into expenditure
   extract($_POST);
    $add_exp = $db->qry("INSERT INTO ExpenditureCategories SET 
                            expCatName = '" . $expCatName . "',
                            createdUser = " . $user_id . ",
                            updatedUser = " . $user_id);  
    echo json_encode($add_exp);
}
if($_GET['action'] === 'update') {
	//updating the expenditure data
   extract($_POST);
    $upd_exp = $db->qry("UPDATE ExpenditureCategories SET 
                            expCatName = '" . $expCatName . "',
                            updatedUser = " . $user_id . " WHERE expCatId = '" . $expCatId . "'");
    echo json_encode($upd_exp);
}
if($_GET['action'] === 'change_status' && $_GET['expCatId'] !== null) {
	
	//change the status of expenditure
 $get_status = $db->qry("SELECT expStatus FROM ExpenditureCategories WHERE expCatId = '" . $_GET['expCatId'] . "'");
    if((int) $get_status[0]['expStatus'] == 1) {
        $change_status = $db->qry("UPDATE ExpenditureCategories SET 
                                expStatus = 0 WHERE expCatId = '" . $_GET['expCatId'] . "'");
    } else {
        $change_status = $db->qry("UPDATE ExpenditureCategories SET 
                                expStatus = 1 WHERE expCatId = '" . $_GET['expCatId'] . "'");
    }
    echo json_encode($change_status);
}