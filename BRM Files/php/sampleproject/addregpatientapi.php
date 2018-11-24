<?php
header('Content-Type: application/json');
include ("functions.php");
class addpatientapi
{
	function addpatient_reg()
	{
		$finalres;
		$pname=$_REQUEST["patient_name"];
		$pphone=$_REQUEST["patient_phone"];
		$docid=$_REQUEST["doctor_id"];
		$pfee=$_REQUEST["patient_fee"];
		$fee_paid=$_REQUEST["fee_paid"];
		$c=new mydata();
		//perform validations
		if($pname=="")
		{
			$data['value']="error";
			$data['message']="Please enter patient name";
		}
		else if($pphone=="")
		{
			$data['value']="error";
			$data['message']="Please enter patient phone number";
		}
		else if($docid=="")
		{
			$data['value']="error";
			$data['message']="Please enter doctor id";
		}
		else if($pfee=="")
		{
			$data['value']="error";
			$data['message']="Please enter fee amount";
		}
		else if($fee_paid=="")
		{
			$data['value']="error";
			$data['message']="is fee paid or not";
		}
		else
		{
			$res=$c->addregular_patient_data($pname,$pphone,$pfee,$docid,$fee_paid);
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
$g=new addpatientapi();

echo json_encode($g->addpatient_reg());
?>
