<?php
header('Content-Type: application/json');
include ("functions.php");
class getdoctorslist
{
	function getdoctors()
	{
		$finalres;
		$type=$_REQUEST["doctor_type"];
		$c=new mydata();
		//perform validations
		if($type=="")
		{
			$data['value']="error";
			$data['message']="Please enter type of doctors data";
		}
		else
		{
			if($type==1) //regular doctors data
			{
				$data[]=$c->getregular_doctors_data();
			}
			else if($type==2) //surgery doctors
			{
				$data[]=$c->getsurgery_doctors_data();
			}
			else
			{
				$data[]=$c->getanesthesia_doctors_data();
			}
		}
		$finalres[]=$data;
		return $finalres;
	}
	
}
$g=new getdoctorslist();

echo json_encode($g->getdoctors());
?>
