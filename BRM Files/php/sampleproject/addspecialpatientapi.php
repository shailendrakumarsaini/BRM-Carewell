<?php
header('Content-Type: application/json');
include ("functions.php");
class addspecialpatientapi
{
	function addspecialpatient_reg()
	{
		$finalres;
		$obj = json_decode($_GET['json'], TRUE);
		//print_r($obj);
		$c=new mydata();
		if($obj[0]['patient_name']=="")
		{
			$data['value']="error";
			$data['message']="Please enter patient name";
		}
		else if($obj[0]['diag_type']=="")
		{
			$data['value']="error";
			$data['message']="Please enter diagnosis type";
		}
		else if($obj[0]['days']=="")
		{
			$data['value']="error";
			$data['message']="Please enter number of days";
		}
		else if($obj[0]['admission_on']=="")
		{
			$data['value']="error";
			$data['message']="Please enter admission date";
		}
		else if($obj[0]['discharge_on']=="")
		{
			$data['value']="error";
			$data['message']="Please enter discharge date";
		}
		else if($obj[0]['diag_type']=='1' && $obj[0]['tot_package']=="")
		{
			$data['value']="error";
			$data['message']="Please enter total package amount";
		}
		else if($obj[0]['diag_type']=='2' && $obj[0]['surg_doctor_id']=="")
		{
			$data['value']="error";
			$data['message']="Please enter surgery doctor id";
		}
		else if($obj[0]['diag_type']=='2' && $obj[0]['surg_fee']=="")
		{
			$data['value']="error";
			$data['message']="Please enter surgery doctor fee";
		}
		else if($obj[0]['diag_type']=='2' && $obj[0]['surg_fee_paid']=="")
		{
			$data['value']="error";
			$data['message']="Please enter surgery doctor fee status";
		}
		else if($obj[0]['diag_type']=='3' && $obj[0]['anst_doctor_id']=="")
		{
			$data['value']="error";
			$data['message']="Please enter ansthesia doctor id";
		}
		else if($obj[0]['diag_type']=='3' && $obj[0]['anst_fee']=="")
		{
			$data['value']="error";
			$data['message']="Please enter ansthesia doctor fee";
		}
		else if($obj[0]['diag_type']=='3' && $obj[0]['anst_fee_paid']=="")
		{
			$data['value']="error";
			$data['message']="Please enter ansthesia doctor fee status";
		}
		else if($obj[0]['otmedicne_amount']=="")
		{
			$data['value']="error";
			$data['message']="Please enter otmedicne amount";
		}
		else if($obj[0]['genmedicne_amount']=="")
		{
			$data['value']="error";
			$data['message']="Please enter general medicne amount";
		}
		else if($obj[0]['labcharges']=="")
		{
			$data['value']="error";
			$data['message']="Please enter labcharges amount";
		}
		else if($obj[0]['othercharges']=="")
		{
			$data['value']="error";
			$data['message']="Please enter othercharges amount";
		}
		else
		{
			$res=$c->addspecialpatientdata($obj[0]['patient_name'],$obj[0]['diag_type'],$obj[0]['days'],$obj[0]['admission_on'],$obj[0]['discharge_on'],$obj[0]['tot_package'],$obj[0]['advance_amount'],$obj[0]['received_amount'],$obj[0]['doctor_id'],$obj[0]['doc_fee'],$obj[0]['doc_fee_paid'],$obj[0]['surg_doctor_id'],$obj[0]['surg_fee'],$obj[0]['surg_fee_paid'],$obj[0]['anst_doctor_id'],$obj[0]['anst_fee'],$obj[0]['anst_fee_paid'],$obj[0]['pmp_name'],$obj[0]['pmp_amount'],$obj[0]['pmp_fee_paid'],$obj[0]['pro_name'],$obj[0]['pro_amount'],$obj[0]['pro_fee_paid'],$obj[0]['otmedicne_amount'],$obj[0]['genmedicne_amount'],$obj[0]['labcharges'],$obj[0]['othercharges'],$obj[0]['visiting_doctor_id']);
			if($res==1)
			{
				$data['value']="succes";
				$data['message']="patient data added successfully";
			}
			else
			{
				$data['value']="error";
				$data['message']="patient data not added";
			}
		}
		$finalres[]=$data;
		return $finalres;
	}
	
}
$g=new addspecialpatientapi();

echo json_encode($g->addspecialpatient_reg());
?>
