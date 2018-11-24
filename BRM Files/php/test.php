<?php
include_once("dbclass.php");
$db=new db();

if($_GET['action'] === 'print_post') {
    echo json_encode($_POST);
}

if($_GET['action'] === 'test' && $_GET['data'] !== null) {

    $ins = $db->qry("INSERT INTO test_data SET data = '" . htmlentities($_GET['data']) . "'");
    echo json_encode($ins);
}
?>
