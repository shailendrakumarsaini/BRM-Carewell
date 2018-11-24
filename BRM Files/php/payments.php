<?php
include_once ("dbclass.php");
$db=new db();
/*retrieving the payment data */
if($_GET['action'] == 'all'){
	$result=$db->qry("SELECT p.paymentId,p.individualOrCompany,p.receivedBy,p.purpose,p.invoiceNo,p.invoiceDate,p.	canceledStatus,p.pay_status,p.amount,p.expCatId,e.expCatName FROM Payments AS p LEFT JOIN ExpenditureCategories AS e ON p.expCatId = e.expCatId");
	echo json_encode($result);
}
if($_GET['action'] == 'no_status'){
	$result=$db->qry("SELECT p.paymentId,p.individualOrCompany,p.receivedBy,p.purpose,p.invoiceNo,p.invoiceDate,p.	canceledStatus,p.pay_status,p.amount,p.expCatId,e.expCatName FROM Payments AS p LEFT JOIN ExpenditureCategories AS e ON p.expCatId = e.expCatId where canceledStatus = 0");
	echo json_encode($result);
}

if($_GET['action'] === 'category'){
	$result=$db->qry("select id, supply_category from supplier");
	echo json_encode($result);
}

if($_GET['action'] === 'total'){
	$get_total = $db->qry("select updatedAt, sum(amount) as totalAmount from medwise.Payments where pay_status = 1 AND canceledStatus = 1 group by date_format(updatedAt, '%Y-%m-%d') having date_format(updatedAt, '%Y-%m-%d') = date_format(current_date(), '%Y-%m-%d')");
	echo json_encode($get_total);
}

/*To get the expenditure when the expstatus is one*/
if($_GET['action'] == 'expenditure'){
	$get_data = $db->qry("SELECT expCatId,expCatName FROM ExpenditureCategories WHERE expStatus=1");   
    echo json_encode($get_data);
}
/*selection option for vendors,referrals,staff */
if($_GET['action'] === 'get_rec_ids' && $_GET['user_type'] !== null) {
	if($_GET['user_type'] === 'vendors'){
			$res = $db->qry("SELECT id,name FROM supplier WHERE supply_status = 1");
	}else if($_GET['user_type'] === 'referrals'){
			$res = $db->qry("SELECT ref_id AS id,ref_name AS name FROM referral_master WHERE ref_is_deleted = 1");
	}else if($_GET['user_type'] === 'staff'){
			$res = $db->qry("SELECT uid AS id,name FROM user WHERE status = 1");
	}
	echo json_encode($res);
}
/*inserting the data*/
if($_GET['action'] === 'add') {
    extract($_POST);

    if($invoiceNo === '' || $invoiceNo === null) {
        $invoiceNo = "NULL";
        $invoiceDate = "NULL";
    } else {
		$invoiceDate = date("Y-m-d", strtotime($invoiceDate));
	}
    if($onetimeOrDateRange === 'onetime') {
        $fromDate = date("Y-m-d", strtotime($toDate));
		$toDate = date("Y-m-d", strtotime($toDate));
    } else {
        $fromDate = date("Y-m-d", strtotime($fromDate));
        $toDate = date("Y-m-d", strtotime($toDate));
    }
	
	if($receivedUserId === '') {
		$receivedUserId = "NULL";
	}
	if($expCatId === ''){
		$expCatId = "NULL";
	}
    $dateOfPayment = date("Y-m-d", strtotime($dateOfPayment));
	if($invoiceNo === "NULL") {	
		
		$add_payment = $db->qry("INSERT INTO Payments SET 
                                expCatId = " . $expCatId . ",
                                individualOrCompany = '" . $individualOrCompany . "',
                                receivedBy = '" . $receivedBy . "',
                                purpose = '" . $purpose . "',
                                invoiceNo = " . $invoiceNo . ",
                                invoiceDate = " . $invoiceDate . ",
                                amount = '" . $amount . "',
                                onetimeOrDateRange = '" . $onetimeOrDateRange . "',
                                fromDate = '" . $fromDate . "',
                                toDate = '" . $toDate . "',
                                dateOfPayment = '" . $dateOfPayment . "',
                                cashierId = '" . $user_id . "',
                                createdUser = '" . $user_id . "',
                                updatedUser = '" . $user_id . "',
								pay_status = '" . $pay_status. "',
								receivedUserId = " . $receivedUserId);
	} else {
		$add_payment = $db->qry("INSERT INTO Payments SET 
                                expCatId = " . $expCatId . ",
                                individualOrCompany = '" . $individualOrCompany . "',
                                receivedBy = '" . $receivedBy . "',
                                purpose = '" . $purpose . "',
                                invoiceNo = " . $invoiceNo . ",
                                invoiceDate = '" . $invoiceDate . "',
                                amount = '" . $amount . "',
                                onetimeOrDateRange = '" . $onetimeOrDateRange . "',
                                fromDate = '" . $fromDate . "',
                                toDate = '" . $toDate . "',
                                dateOfPayment = '" . $dateOfPayment . "',
                                cashierId = '" . $user_id . "',
                                createdUser = '" . $user_id . "',
                                updatedUser = '" . $user_id . "',
								pay_status = '" . $pay_status. "',
								receivedUserId = " . $receivedUserId);
	}
    echo json_encode($add_payment);
}
/*updatig the data*/
if($_GET['action'] === 'update') {
    extract($_POST);
    if($invoiceNo === ''|| $invoiceDate == '') {
        $invoiceNo = "NULL";
        $invoiceDate = "NULL";
    } else {
        $invoiceDate = date("Y-m-d", strtotime($invoiceDate));
    }
    if($onetimeOrDateRange === 'OneTime') {
        $fromDate = date("Y-m-d", strtotime($toDate));
    } else {
        $fromDate = date("Y-m-d", strtotime($fromDate));
        $toDate = date("Y-m-d", strtotime($toDate));
    }
    $dateOfPayment = date("Y-m-d", strtotime($dateOfPayment));
    $add_payment = $db->qry("UPDATE Payments SET 
                                expCatId = " . $expCatId . ",
                                individualOrCompany = '" . $individualOrCompany . "',
                                receivedBy = '" . $receivedBy . "',
                                purpose = '" . $purpose . "',
                                invoiceNo = " . $invoiceNo . ",
                                invoiceDate = '" . $invoiceDate . "',
                                amount = '" . $amount . "',
                                onetimeOrDateRange = '" . $onetimeOrDateRange . "',
                                fromDate = '" . $fromDate . "',
                                toDate = '" . $toDate . "',
                                dateOfPayment = '" . $dateOfPayment . "',
                                cashierId = '" . $user_id . "',
                                createdUser = '" . $user_id . "',
                                updatedUser = '" . $user_id . "',
								pay_status = '" . $pay_status. "',
								receivedUserId = '" . $receivedUserId. "' WHERE paymentId = " . $paymentId);

    echo json_encode($add_payment);
}
/*changing the status */
if($_GET['action']=='status' and $_GET['payment_id']!=null){
	
	$current_date = date('Y-m-d');
	
	$res = $db->qry("SELECT canceledStatus, DATE_FORMAT(createdAt, '%Y-%m-%d') AS createdAt FROM Payments WHERE paymentId = ". $_GET['payment_id']);
	
	if($res[0]['canceledStatus'] == 1 AND $current_date == $res[0]['createdAt']){
        $query=("UPDATE Payments SET canceledStatus=0 WHERE paymentId= ".$_GET['payment_id']);
	}else{
        $query=("UPDATE Payments SET canceledStatus=1 WHERE paymentId= ".$_GET['payment_id']);
    }
    
    $update = $db->qry($query);
    echo json_encode($update);
}
/*changing the paid_status*/
if($_GET['action']=='paid_status' and $_GET['payment_id'] != null ){
	
		//echo $_GET['payment_id'];
		$query=("UPDATE Payments SET pay_status=1 WHERE paymentId= ".$_GET['payment_id']);
	
	$update=$db->qry($query);	
}
?>