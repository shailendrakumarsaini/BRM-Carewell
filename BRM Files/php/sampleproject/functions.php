<?php
include_once "config.php";
class mydata
{
	//create the connection of the database
	public function getconnection()
	{
		 $con=mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);
		  if($con)
			{
				// echo "connection established";
			}   
			else
			{
				if (mysqli_connect_errno($con))
				{
					//echo "Failed to connect to MySQL: " . mysqli_connect_error();
				}
			}
			return $con;
	}
	//close the connection of the database
	public function closeconnection($con)
	{
		 mysqli_close($con);
	}
	
	//get the regular doctor list
	public function getregular_doctors_data()
	{
		$finalres;
		//call the connection data
		$con=$this->getconnection();
		$qry="select * from `Regular_doctors`";
		$res=mysqli_query($con,$qry);
		 while($row = mysqli_fetch_assoc($res)) 
		 {
			$finalres[]=$row;
         }
         
      //close the connection
      $this->closeconnection($con);
      return $finalres;
	} 
	//get the surgery doctor list
	public function getsurgery_doctors_data()
	{
		$finalres;
		//call the connection data
		$con=$this->getconnection();
		$qry="select * from `surgery_doctors`";
		$res=mysqli_query($con,$qry);
		 while($row = mysqli_fetch_assoc($res)) 
		 {
			$finalres[]=$row;
         }
         
      //close the connection
      $this->closeconnection($con);
      return $finalres;
	}
	//get the anesthesia doctor list
	public function getanesthesia_doctors_data()
	{
		$finalres;
		//call the connection data
		$con=$this->getconnection();
		$qry="select * from `anesthesia_doctors`";
		$res=mysqli_query($con,$qry);
		 while($row = mysqli_fetch_assoc($res)) 
		 {
			$finalres[]=$row;
         }
         
      //close the connection
      $this->closeconnection($con);
      return $finalres;
	}
	//add the regular patient data
	public function addregular_patient_data($patname,$patphone,$patfee,$doctorid,$feepaid)
	{
		//print the current time and date
		$dtm=date('Y-m-d H:i:s',time());
		//call the connection data
		$con=$this->getconnection();
		$qry="insert into regular_patients(rpatient_name,rpatient_phone,rpatient_doctor_id,rpatient_fee,rpatient_fee_paid,entered_on)values('".$patname."','".$patphone."',".$doctorid.",'".$patfee."',".$feepaid.",'".$dtm."')"; 
		//feepaid 0:unpaid,1:paid
		$res=mysqli_query($con,$qry);
		if($res)
		{
			return 1;
		}
		else
		{
			return 0;
		}
		//close the connection
      $this->closeconnection($con);
	}
	//add the special patient data as package/surgery/medical 1:package,2:surgery,3:medical
	public function addspecialpatientdata($patname,$diatype,$days,$admission_on,$disch_on,$tot_pack,$adv_amount,$rec_amount,$doc_id,$doc_fee,$doc_fee_paid,$surg_doc_id,$surg_fee,$surg_fee_paid,$anst_doc_id,$anst_fee,$anst_fee_paid,$pmp_name,$pmp_fee,$pmp_fee_paid,$pro_name,$pro_fee,$pro_fee_paid,$otmed_amount,$genmed_amount,$lab_amount,$other_amount,$visit_doc_id)
	{
		//print the current time and date
		$dtm=date('Y-m-d');
		//call the connection data
		$con=$this->getconnection();
		$qry="insert into special_patient_info(patient_name,diag_type,days,admission_on,discharge_on,tot_package,advance_amount,received_amount,doctor_id,doc_fee,doc_fee_paid,surg_fee,surg_doctor_id,surg_fee_paid,anst_doctor_id,anst_fee,anst_fee_paid,pmp_name,pmp_amount,pmp_fee_paid,pro_name,pro_amount,pro_fee_paid,otmedicne_amount,genmedicne_amount,labcharge,othercharge,visiting_doctor_id,entered_on) values('".$patname."',".$diatype.",'".$days."','".$admission_on."','".$disch_on."','".$tot_pack."','".$adv_amount."','".$rec_amount."',".$doc_id.",'".$doc_fee."',".$doc_fee_paid.",".$surg_doc_id.",'".$surg_fee."',".$surg_fee_paid.",".$anst_doc_id.",'".$anst_fee."',".$anst_fee_paid.",'".$pmp_name."','".$pmp_fee."',".$pmp_fee_paid.",'".$pro_name."','".$pro_fee."',".$pro_fee_paid.",'".$otmed_amount."','".$genmed_amount."','".$lab_amount."','".$other_amount."',".$visit_doc_id.",'".$dtm."')";
		echo $qry;
		$res=mysqli_query($con,$qry);
		if($res)
		{
			return 1;
		}
		else
		{
			return 0;
		}
		//close the connection
		$this->closeconnection($con);
	}
	
	
}
/*$c=new mydata();
$w=$c->getregular_doctors_data();
print_r($w);*/
?>
