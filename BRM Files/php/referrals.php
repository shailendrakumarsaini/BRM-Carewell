<?php
include_once("dbclass.php");
$db=new db();

    if($_GET['act']=='all'){
        //Retrieving the referrals data
        $res = $db->qry("select * from referral_master");
        echo json_encode($res);
    }

    if($_GET['action']== 'ref_status'){
        //getting the referral name with referral status is one
        $result = $db->qry("select ref_id,ref_name from referral_master where ref_is_deleted= 1 ");
        echo json_encode($result);
    }

    if($_GET['act'] === 'add'){
        //Adding the data into referral_master
        extract($_POST);

        print_r($_POST);
		
        //print_r($_FILES);
         

        $getcode = $db->qry("select ref_code from referral_master order by ref_code desc limit 1");

        if(gettype($getcode) === 'array') {
            $tnumber = preg_replace("/[^-0-9]+/", '', $getcode[0]['ref_code'])+1;
        } else {
            $tnumber = 1;
        }

        $ref_code = "REF".$tnumber;
		
		if($ref_acc_hol_name == 'undefined'){
			$ref_acc_hol_name = '';
		}
		if($ref_account_no == 'undefined'){
			$ref_account_no = '';
		}
		if($ref_bank_name == 'undefined'){
			$ref_branch = '';
		}
		if($ref_branch == 'undefined'){
			$ref_branch = '';
		}
		if($ref_ifsc_code == 'undefined'){
			$ref_ifsc_code = '';
		}
		if($ref_email == 'undefined'){
			$ref_email = '';
		}
		
        $add_rec = $db->qry("insert into referral_master (ref_code,ref_name,ref_occupation,ref_org_type,ref_org_name,ref_address,ref_city,ref_mobile,ref_whatsapp,ref_email,ref_srb,ref_acc_hol_name,ref_account_no,ref_bank_name,ref_branch, ref_ifsc_code) values ('$ref_code','$ref_name','$ref_occupation','$ref_org_type','$ref_org_name','$ref_address','$ref_city','$ref_mobile','$ref_whatsapp','$ref_email','$ref_srb','$ref_acc_hol_name','$ref_account_no','$ref_bank_name','$ref_branch','$ref_ifsc_code')");

        $refId = $db->id();

        //upload image
        $target_dir = "../uploads/referrals/";
		
        $actualFileName = basename($_FILES["refPhoto"]["name"]);
        $explodeFileName = explode(".", $actualFileName);
        $extensionOfFile = end($explodeFileName);
		$storedFileName = $refId . '.' . $extensionOfFile;
        $target_file = $target_dir . $storedFileName;
		
        if (move_uploaded_file($_FILES["refPhoto"]["tmp_name"], $target_file)) {
			echo "The file ". basename( $_FILES["refPhoto"]["name"]). " has been uploaded.";
		} else {
			echo "Sorry, there was an error uploading your file.";
		}
        
        echo $updateReferral = $db->qry("UPDATE referral_master SET ref_image_name = '" . $storedFileName . "' WHERE ref_id = " . $refId);
		
        echo json_encode($add_rec);
    }

    if($_GET['act'] == 'st'){
        //changing the status of the referral_master
    $db->qry("update  referral_master set ref_is_deleted=".$_GET['ref_is_deleted']." where ref_id=".$_GET['ref_id']);
        echo "Status Change Successfully!";
    }

    if($_GET['act']=='up'){
        
    //updating the referral_master
        extract($_POST);
    //print_r($_POST);
    $update=$get_rec=$db->qry("update referral_master set ref_name='$ref_name',ref_occupation='$ref_occupation',ref_org_type='$ref_org_type',ref_org_name='$ref_org_name',ref_address='$ref_address',ref_city='$ref_city',ref_mobile='$ref_mobile',ref_whatsapp='$ref_whatsapp',ref_email='$ref_email',ref_srb='$ref_srb',ref_acc_hol_name='$ref_acc_hol_name',ref_account_no='$ref_account_no',ref_bank_name='$ref_bank_name',ref_branch='$ref_branch',ref_ifsc_code='$ref_ifsc_code' where ref_id='$ref_id'");
    }

    if($_GET['action']=='model' && $_GET['ref_id'] != ''){
    //model for the account holder
    $result=$db->qry("select ref_acc_hol_name, ref_account_no, ref_bank_name, ref_branch, ref_ifsc_code from referral_master where ref_id =".$_GET['ref_id']);

    echo json_encode($result);
    }
?>