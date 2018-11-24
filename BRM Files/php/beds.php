<?php
include_once("dbclass.php");
$db=new db();

if($_GET['act'] == 'all') {
	//Get all details of beds.
	
	$res = $db->qry("SELECT * FROM bed_master AS b JOIN locations AS l ON l.loc_id = b.bed_loc_id ORDER BY l.loc_id ASC");
	echo json_encode($res);
}

if($_GET['act']=='getFreeBeds') {
    //Get all details of beds.

	$res=$db->qry("SELECT * FROM bed_master AS b JOIN locations AS l ON l.loc_id = b.bed_loc_id AND b.bed_id NOT IN(SELECT bedId FROM RoomAllotment WHERE checkInOrCheckOut = 'checkIn') ORDER BY l.loc_id ASC");
	echo json_encode($res);
}
  
if($_GET['act']=='add') {
    //Add new bed.

    extract($_POST);
    $get_locdata = $db->qry("select * from locations  where loc_id = $bed_loc_id");
    $locname = $get_locdata[0]['loc_name'];
	$add_rec = $db->qry("insert into bed_master (bed_code,bed_loc_id,bed_loc_name,extra_data, rentAmount) values ('$bed_code','$bed_loc_id','$locname','$extra_data', '$rent_amount')");
	echo json_encode($add_rec);
}

if($_GET['act']=='up') {
    //Update bed data.

	extract($_POST);
	$get_locdata=$db->qry("select * from locations  where loc_id=$bed_loc_id");
    $locname=$get_locdata[0]['loc_name'];
	$update=$get_rec=$db->qry("update bed_master set bed_code='$bed_code',bed_loc_id='$bed_loc_id',	bed_loc_name='$locname', rentAmount = '$rent_amount', extra_data='$extra_data' where bed_id='$bed_id'");
	echo json_encode($update);	
	
}

if ($_GET['act']=='for_bed_allocation'){
    //Bed details for bed allocation.

	$bed_array = array();
	$block_names = $db->qry("SELECT DISTINCT block_name FROM locations");

	$block_index = 0;
    $flag = true;
    $is_bed_pushed = false;

	foreach ($block_names as $block) {

		foreach ($block as $block_key => $block_value) {
			

			if ($block_key === 'block_name') {

				$get_rooms_under_blocks = $db->qry("SELECT loc_name, loc_id FROM locations WHERE block_name = '" . $block_value . "'");

				if (gettype($get_rooms_under_blocks) === 'array') {

                    $room_index = 0;
                    
					foreach ($get_rooms_under_blocks as $get_rooms_under_block) {

						foreach ($get_rooms_under_block as $room_key => $room_value) {
							
							if ($room_key === 'loc_name') {

								$get_beds_under_rooms = $db->qry("SELECT bed_id FROM bed_master AS b WHERE b.bed_loc_id = '" . end($get_rooms_under_block) . "'");

								if (gettype($get_beds_under_rooms) === 'array') {

                                    $bed_index = 0;
                                    $is_bed_pushed = true;
                                    
									foreach ($get_beds_under_rooms as $get_beds_under_room) {
										
										foreach ($get_beds_under_room as $bed_key => $bed_value) {
											
                                            $bed_array["blocks"][$block_index]["rooms"][$room_index]["beds"][$bed_index][$bed_key] = $bed_value;
                                            
                                            $getRentAmount = $db->qry("SELECT rentAmount FROM bed_master WHERE bed_id = " . $bed_value);

                                            $bed_array["blocks"][$block_index]["rooms"][$room_index]["beds"][$bed_index]["rentAmount"] = $getRentAmount[0]['rentAmount'];

                                            $is_bed_allocated = $db->count('patientId', 'RoomAllotment', 'WHERE bedId = "' . $bed_value . '" AND checkInOrCheckOut = "checkIn"');
                                            
                                            //echo 'WHERE bedId = "' . $bed_value . '" AND checkInOrCheckOut = "checkIn"' . '<br/>';
											
											if ($is_bed_allocated > 0) {

												$bed_array["blocks"][$block_index]["rooms"][$room_index]["beds"][$bed_index]["is_allocated"] = "1";
												
												$get_patient_id = $db->qry("SELECT patientId FROM RoomAllotment WHERE bedId = '" . $bed_value . "' AND checkInOrCheckOut = 'checkIn'");

												$bed_array["blocks"][$block_index]["rooms"][$room_index]["beds"][$bed_index]["patient_id"] = $get_patient_id[0]["patientId"];
											} else {

												$bed_array["blocks"][$block_index]["rooms"][$room_index]["beds"][$bed_index]["is_allocated"] = "0";
												$bed_array["blocks"][$block_index]["rooms"][$room_index]["beds"][$bed_index]["patient_id"] = "";
											}



											$bed_index++;

											$bed_array["blocks"][$block_index]["block_name"] = $block_value;
											$bed_array["blocks"][$block_index]["rooms"][$room_index]["room_name"] = $room_value;
										}
									}
								} else {

									$room_index--;
								}
							}
						}
						
						$room_index++;
					}							
				}
			}					
		}
		$flag = false;
		if($is_bed_pushed) {
			$block_index++;
			$is_bed_pushed = false;
		}
	}

    //echo '<pre>', print_r($bed_array), '</pre>';
	echo json_encode($bed_array);	
}
?>