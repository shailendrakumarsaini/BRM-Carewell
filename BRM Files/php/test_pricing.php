<?php
include_once("dbclass.php");
$db = new db();

if ($_GET['action'] === 'get_test_pricing_data') {
    $test_price_data = $db->qry("SELECT lt.test_name, tp.test_price_id, tp.test_id, tp.price, lt.ref_values FROM test_pricing AS tp JOIN lab_test AS lt ON lt.lab_test_id = tp.test_id");
    echo json_encode($test_price_data);
}

if ($_GET['action'] === 'add') {

    extract($_POST);
    
    $ins_test_price = $db->qry("INSERT INTO test_pricing SET 
                                    test_id = '" . $test_pricing['test_id'] . "',
                                    price = '" . $test_pricing['test_price'] . "',
                                    user_id = '" . $test_pricing['user_id'] . "'");

    echo json_encode($ins_test_price);
}


if ($_GET['action'] === 'update') {
    extract($_POST);

    $upd_test_price = $db->qry("UPDATE test_pricing SET 
                                    price = '" . $test_pricing['price'] . "',
                                    user_id = '" . $test_pricing['user_id'] . "' WHERE test_price_id = '" . $test_pricing['test_price_id'] . "'");

    echo json_encode($upd_test_price);
}
?>