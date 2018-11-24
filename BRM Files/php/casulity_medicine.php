<?php
include_once("dbclass.php");
$db=new db();

if($_GET['action'] === 'store_details'){
	$rec=$db->qry("SELECT * FROM store");
	 echo json_encode($rec);
}

if($_GET['action'] === 'get_specificedate' && $_GET['from_date'] !== null && $_GET['to_date'] !== null){

	$from_date_time = date("Y-m-d H:i:s", strtotime($_GET['from_date']));
    $to_date_time = date("Y-m-d H:i:s", strtotime($_GET['to_date']));

	$res = $db->qry("SELECT cm.patient_id, cm.p_visit_id , p.name, cm.issued, DATE_FORMAT(cm.date_time, '%d-%m-%Y') AS date_time FROM casualty_medicines  AS cm JOIN store AS s ON cm.store_id = s.id JOIN patient_info AS p ON p.patient_id = cm.patient_id JOIN patient_visit AS pv ON pv.p_visit_id = cm.p_visit_id  WHERE cm.date_time BETWEEN '" . $from_date_time . "' AND '" . $to_date_time . "' GROUP BY pv.p_visit_id");
	
	foreach($res AS $key => $eachRecord) {
		
		$isAllReplaced = $db->qry("SELECT COUNT(cm.p_visit_id) AS notIssuedCount FROM casualty_medicines AS cm WHERE cm.p_visit_id = " . $eachRecord['p_visit_id'] . " AND cm.issued <> 1");
		
		if((int) $isAllReplaced[0]['notIssuedCount'] > 0) {
			$res[$key]['isAllReplaced'] = false;
		} else {
			$res[$key]['isAllReplaced'] = true;
		}
	}

	echo json_encode($res);
}


if($_GET['action'] === 'getCasualtyData'){

	$res = $db->qry("SELECT cm.patient_id, cm.p_visit_id, p.name, cm.issued, DATE_FORMAT(cm.date_time, '%Y-%m-%d') AS date_time FROM casualty_medicines AS cm JOIN store AS s ON cm.store_id = s.id  JOIN patient_info AS p ON p.patient_id = cm.patient_id JOIN patient_visit AS pv ON p.patient_id = pv.patient_id GROUP BY pv.p_visit_id, cm.date_time");

	echo json_encode($res);
}

if($_GET['action'] === 'CasualtyData' AND $_GET['visit_id'] !== null){

	$res = $db->qry("SELECT cm.casualty_medicine_id, cm.patient_id, cm.p_visit_id, cm.issued, DATE_FORMAT(cm.date_time, '%Y-%m-%d') AS date_time, cm.batch_no, cm.expiry_date, s.id AS store_id, s.store_name, cm.quantity, m.med_id, m.med_name, IFNULL(mp.mpo_mrp , mir.mrp) AS price, cm.medicine_stock_id FROM casualty_medicines AS cm JOIN store AS s ON cm.store_id = s.id JOIN patient_info AS p ON p.patient_id = cm.patient_id JOIN patient_visit AS pv ON cm.p_visit_id = pv.p_visit_id JOIN medicine_stock_register AS msr ON cm.medicine_stock_id = msr.medicine_stock_id JOIN medicines AS m ON m.med_id = msr.item_id LEFT JOIN medicine_inward_register AS mir ON mir.item_id = msr.item_id AND mir.batch_no = msr.batch_no AND mir.expiry_date = msr.expiry_date LEFT JOIN medicines_podata AS mp ON mp.medicine_po_id = mir.medicinepo_id AND mp.mpo_item_id = mir.item_id WHERE cm.p_visit_id = '" . $_GET['visit_id'] . "'");

	echo json_encode($res);
}


if($_GET['action'] === 'add') {

    extract($_POST);

    //print_r($_POST);

	$medicine_casualty_date = date("Y-m-d H:i:s",  strtotime($casualtyMed['date_time']));

    foreach($casualtyMed['casualtyDetails'] as $medicine_items) {

        $add_casualty = " INSERT INTO casualty_medicines SET
                                patient_id = '" . $casualtyMed['patient_id'] . "',
                                store_id = '" . $medicine_items['store_id'] . "',
                                medicine_stock_id = '" . $medicine_items['medicine_stock_id'] . "',
                                quantity = '" . $medicine_items['quantity'] . "',
                                date_time = '" . $medicine_casualty_date . "',
								p_visit_id = '" . $casualtyMed['visit_id'] . "' ";

        $stock_count = $db->count('medicine_stock_id', 'medicine_stock_register', 'WHERE medicine_stock_id = ' . $medicine_items['medicine_stock_id']);

        if ($stock_count > 0) {

            $get_stock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE medicine_stock_id = " . $medicine_items['medicine_stock_id']);

            $quantity = $get_stock_reg[0]['quantity'];
            $quantity -= (double) $medicine_items['quantity'] ;

            $update_stock_reg = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $quantity . "' WHERE medicine_stock_id = " . $medicine_items['medicine_stock_id']);
        }
        $res_casualty = $db->qry($add_casualty);
    }

	echo json_encode($res_casualty);
}

if($_GET['action'] === 'change') {

	extract($_POST);
	
	foreach($obj['items'] AS $medicine_items) {
		if(($medicine_items['batch_no'] !== null || $medicine_items['batch_no'] !== '') && ($medicine_items['expiry_date'] !== null || $medicine_items['expiry_date'] !== '')) {
			
			$issued = ($medicine_items['issued'] === 'true') ? true : false;
			$isFirstTime = ($medicine_items['isFirstTime'] === 'true') ? true : false;
			if($issued && $isFirstTime) {
				
				$stock_count = $db->count('medicine_stock_id', 'medicine_stock_register', 'WHERE store_id = "' . $medicine_items['store_id'] . '" AND item_id = "' . $medicine_items['med_id'] . '" AND batch_no = "'. $medicine_items['batch_no'] .'" AND expiry_date = "'. date("Y-m-d", strtotime($medicine_items['expiry_date'])) .'"');
				
				if ($stock_count > 0) {


					$get_stock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE
					store_id = '" . $medicine_items['store_id'] . "' AND item_id = '" . $medicine_items['med_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['expiry_date'])) . "'");

					$quantity = $get_stock_reg[0]['quantity'];
					$quantity += $medicine_items['quantity'];

					$update_stock_reg = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $quantity . "' WHERE store_id = '" .$medicine_items['store_id']. "' AND item_id = '" . $medicine_items['med_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['expiry_date'])) ."'");

				} else {

					$quantity = $medicine_items['quantity'];
					
					$res_for_last_sequence = $db->qry("SELECT MAX(medicine_sequence_no) AS medicine_sequence_no FROM medicine_sequence_nos;");
				
					if ($res_for_last_sequence[0]['medicine_sequence_no']){
						$start_sequence_no = $res_for_last_sequence[0]['medicine_sequence_no'] + 1;
						$end_sequence_no = ($start_sequence_no + $quantity) - 1;
					} else {
						$start_sequence_no = 1;
						$end_sequence_no = ($start_sequence_no + $quantity) - 1;
					}

					$ins_mi_ob_register = $db->qry("INSERT INTO medicine_inward_register SET 
											store_id = '" . $medicine_items['store_id'] . "',
											item_id = '" . $medicine_items['med_id'] . "',
											mrp = '" . $medicine_items['price'] . "',
											purchase_price = '" . $medicine_items['price'] . "',
											item_qty = '" . $quantity . "',
											received_date = '" . date("Y-m-d") . "',
											user_id = '" . $obj['user_id'] . "',
											start_sequence = '" . $start_sequence_no . "',
											end_sequence = '" . $end_sequence_no . "',
											batch_no = '" . $medicine_items['batch_no'] . "',
											expiry_date = '" . date("Y-m-d", strtotime($medicine_items['expiry_date'])) . "'");
											
											
					$insert_stock_reg = $db->qry("INSERT INTO medicine_stock_register SET
													store_id = '" . $medicine_items['store_id'] . "',
													item_id = '" . $medicine_items['med_id'] . "',
													quantity = '" . $quantity . "',
													batch_no = '" . $medicine_items['batch_no'] . "',
													expiry_date = '". date("Y-m-d", strtotime($medicine_items['expiry_date'])) ."'");
				}
				
				$updateCasualty = $db->qry("UPDATE casualty_medicines SET 
												batch_no = '" . $medicine_items['batch_no'] . "',
												expiry_date = '" . date("Y-m-d", strtotime($medicine_items['expiry_date'])) . "',
												issued = 1 WHERE casualty_medicine_id = " . $medicine_items['casualty_medicine_id']);
			}
		}
	}
	
	echo json_encode($updateCasualty);

	/*foreach($obj['items'] AS $medicine_items) {
		$stock_count = $db->count('medicine_stock_id', 'medicine_stock_register', 'WHERE store_id = "' . $medicine_items['store_id'] . '" AND item_id = "' . $medicine_items['med_id'] . '" AND batch_no = "'. $medicine_items['batch_no'] .'" AND expiry_date = "'. date("Y-m-d", strtotime($medicine_items['expiry_date'])) .'"');

            if ($stock_count > 0) {


                $get_stock_reg = $db->qry("SELECT quantity FROM medicine_stock_register WHERE
				store_id = '" . $medicine_items['store_id'] . "' AND item_id = '" . $medicine_items['med_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['expiry_date'])) . "'");

                $quantity = $get_stock_reg[0]['quantity'];
                $quantity += $medicine_items['quantity'];

                $update_stock_reg = $db->qry("UPDATE medicine_stock_register SET quantity = '" . $quantity . "' WHERE store_id = '" .$medicine_items['store_id']. "' AND item_id = '" . $medicine_items['med_id'] . "' AND batch_no = '". $medicine_items['batch_no'] ."' AND expiry_date = '". date("Y-m-d", strtotime($medicine_items['expiry_date'])) ."'");

            } else {

                $quantity = $medicine_items['quantity'];

                $insert_stock_reg = $db->qry("INSERT INTO medicine_stock_register SET
                                                store_id = '" . $medicine_items['store_id'] . "',
                                                item_id = '" . $medicine_items['med_id'] . "',
                                                quantity = '" . $quantity . "',
										        batch_no = '" . $medicine_items['batch_no'] . "',
                                                expiry_date = '". date("Y-m-d", strtotime($medicine_items['expiry_date'])) ."'");
            }
	}


    $updateCasualty = $db->qry("UPDATE casualty_medicines SET issued = '1' WHERE p_visit_id = " . $obj['visit_id']);

	echo json_encode($updateCasualty);*/

}

?>
