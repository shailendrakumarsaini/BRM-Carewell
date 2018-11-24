<?php
include_once("dbclass.php");
$db = new db();

if($_GET['action']=='get_bill_cateories') {
    $res = $db->qry("SELECT * FROM billcategory");
    echo json_encode($res);
}

if($_GET['action']=='get_general_bill_categories') {
    $res = $db->qry("SELECT * FROM billcategory WHERE bcname <> 'LABS' AND bcname <> 'PHARMACY'");
    echo json_encode($res);
}