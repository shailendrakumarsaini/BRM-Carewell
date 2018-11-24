<?php
include_once ("dbclass.php");
$db=new db();

if($_GET['action'] === 'add') {
    
    extract($_POST);

    
    //Checking if the patient is exists in informationsheet or not
    $selQry = $db->qry("select * from InformationSheet where patientId='".$informationSheet['ptdetails']['patientId']."'");

    $patientid = $informationSheet['ptdetails']['patientId'];
    $visitedid = $informationSheet['ptdetails']['visitId'];
    $currDate  = date("Y-m-d H:i:s");

    //Patient Exists in information sheet (Update)
    if(is_array($selQry)){
       
        print_r($_POST);
        exit;

        $insertIS = $db->qry("UPDATE InformationSheet SET
                                    patientId = " . $informationSheet['ptdetails']['patientId'] .",
                                    visitId = " . $informationSheet['ptdetails']['visitId'] . ",
                                    createdUser = " . $informationSheet['userId'] . ",
                                    updatedUser = " . $informationSheet['userId'] . ",
                                    financeDetails = '" . json_encode($informationSheet) . "',
                                    notes='".$informationSheet['notes']."'");


    }else{

      /*   print_r($informationSheet);
        exit; */
    //Patient not Exists in information shee (Insert)
     $insertIS = $db->qry("INSERT INTO InformationSheet SET
                            patientId = " . $informationSheet['ptdetails']['patientId'] .",
                            visitId = " . $informationSheet['ptdetails']['visitId'] . ",
                            createdUser = " . $informationSheet['userId'] . ",
                            updatedUser = " . $informationSheet['userId'] . ",
                            financeDetails = '" . json_encode($informationSheet) . "',
                            notes='".$informationSheet['notes']."'");


        if($informationSheet['Surgen']){
            $sdateofPay=null;
            if($informationSheet['Surgen']['tempDate'] != ''){
                $sdateofPay = str_replace("(India Standard Time)", "", $informationSheet['Surgen']['tempDate']);
                $sdateofPay = date("Y-m-d H:i:s", strtotime($sdateofPay));
            }
                                  
            $sugQry = $db->qry("insert into InformationSheetDoctorPayments set 
                                patientId = '".$patientid."',visitId='".$visitedid."',doctorId='".$informationSheet['Surgen']['dr_id']."',
                                noOfVisits = '".$informationSheet['Surgen']['visitCount']."',facilityGroupId='2',amountPaid='".$informationSheet['Surgen']['amount']."',isPaid='".$informationSheet['Surgen']['paid']."',
                                remarks='".$informationSheet['Surgen']['remarks']."',dateOfPayment='".$sdateofPay."',createdUser='".$informationSheet['userId']."'");  

        }

        if($informationSheet['physician']){
            $pdateofPay=null;
            if($informationSheet['physician']['tempDate'] != ''){
                $pdateofPay = str_replace("(India Standard Time)", "", $informationSheet['physician']['tempDate']);
                $pdateofPay = date("Y-m-d H:i:s", strtotime($pdateofPay));
            }
                        
            $pugQry = $db->qry("insert into InformationSheetDoctorPayments set 
                                patientId = '".$patientid."',visitId='".$visitedid."',doctorId='".$informationSheet['physician']['dr_id']."',
                                noOfVisits = '".$informationSheet['physician']['visitCount']."',facilityGroupId='2',amountPaid='".$informationSheet['physician']['amount']."',isPaid='".$informationSheet['physician']['paid']."',
                                remarks='".$informationSheet['physician']['remarks']."',dateOfPayment='".$pdateofPay."',createdUser='".$informationSheet['userId']."'");  

        }

        if($informationSheet['Anesthesian']){
            $adateofPay=null;
            if($informationSheet['Anesthesian']['tempDate'] != ''){
                $adateofPay = str_replace("(India Standard Time)", "", $informationSheet['Anesthesian']['tempDate']);
                $adateofPay = date("Y-m-d H:i:s", strtotime($adateofPay));
            }
                    
            $augQry = $db->qry("insert into InformationSheetDoctorPayments set 
                                patientId = '".$patientid."',visitId='".$visitedid."',doctorId='".$informationSheet['Anesthesian']['dr_id']."',
                                noOfVisits = '".$informationSheet['Anesthesian']['visitCount']."',facilityGroupId='2',amountPaid='".$informationSheet['Anesthesian']['amount']."',isPaid='".$informationSheet['Anesthesian']['paid']."',
                                remarks='".$informationSheet['Anesthesian']['remarks']."',dateOfPayment='".$adateofPay."',createdUser='".$informationSheet['userId']."'");  

        }

        //cumulative Consultants Records
        if($informationSheet['cumulativeConsultants']){

            $cLength        = count($informationSheet['cumulativeConsultants']);
            $cumulativeC    =  $informationSheet['cumulativeConsultants'];

            for($x=0;$x<$cLength;$x++){
                
                if($cumulativeC[$x]['tempDate'] != ''){
                    $tmpDate = null;
                    $tmpDate = str_replace("(India Standard Time)", "", $cumulativeC[$x]['tempDate']);
                    $tmpDate = date("Y-m-d H:i:s", strtotime($tmpDate));
                }
               

                $augQry = $db->qry("insert into InformationSheetDoctorPayments set 
                                patientId = '".$patientid."',visitId='".$visitedid."',doctorId='".$cumulativeC[$x]['dr_id']."',
                                noOfVisits = '".$cumulativeC[$x]['visitCount']."',facilityGroupId='2',amountPaid='".$cumulativeC[$x]['amount']."',isPaid='".$cumulativeC[$x]['paid']."',
                                remarks='".$cumulativeC[$x]['remarks']."',dateOfPayment='".$tmpDate."',createdUser='".$informationSheet['userId']."'"); 

            }


        }


        //Referral
        if($informationSheet['referral']){
            
            if($informationSheet['referral']['tempDate'] != ''){
                $rdateofPay = str_replace("(India Standard Time)", "", $informationSheet['referral']['tempDate']);
                $rdateofPay = date("Y-m-d H:i:s", strtotime($rdateofPay));
               
            }
                                     
            $refQry = $db->qry("insert into InformationSheetReferralPayments set 
                                patientId = '".$patientid."',visitId='".$visitedid."',referralId='".$informationSheet['referral']['ref_id']."',facilityGroupId='2',amountPaid='".$informationSheet['referral']['amount']."',isPaid='".$informationSheet['referral']['paid']."',
                                remarks='".$informationSheet['referral']['remarks']."',dateOfPayment='".$rdateofPay."',createdUser='".$informationSheet['userId']."'");  

        }
        

        if($informationSheet['pro']){
            $prdateofPay = null;
            if($informationSheet['pro']['tempDate'] != ''){
                $prdateofPay = str_replace("(India Standard Time)", "", $informationSheet['pro']['tempDate']);
                $prdateofPay = date("Y-m-d H:i:s", strtotime($prdateofPay));
            }
                        
            $proQry = $db->qry("insert into InformationSheetReferralPayments set 
                                patientId = '".$patientid."',visitId='".$visitedid."',referralId='".$informationSheet['pro']['ref_id']."',facilityGroupId='2',amountPaid='".$informationSheet['pro']['amount']."',isPaid='".$informationSheet['pro']['paid']."',
                                remarks='".$informationSheet['pro']['remarks']."',dateOfPayment='".$prdateofPay."',createdUser='".$informationSheet['userId']."'");  

        }



        if($informationSheet['OTMedicines']){

                                    
            $oroQry = $db->qry("insert into InformationSheetPayments  set 
                                patientId = '".$patientid."',visitId='".$visitedid."',facilityGroupId='10',facilityId='13',amountPaid='".$informationSheet['OTMedicines']."',dateOfPayment='".$currDate."',createdUser='".$informationSheet['userId']."'");  

        }


        if($informationSheet['GeneralMedicines']){

            
                        
            $oroQry = $db->qry("insert into InformationSheetPayments  set 
                                patientId = '".$patientid."',visitId='".$visitedid."',facilityGroupId='10',facilityId='14',amountPaid='".$informationSheet['GeneralMedicines']."',dateOfPayment='".$currDate."',createdUser='".$informationSheet['userId']."'");  

        }

        if($informationSheet['LabCharges']){

            $oroQry = $db->qry("insert into InformationSheetPayments  set 
                                patientId = '".$patientid."',visitId='".$visitedid."',facilityGroupId='10',facilityId='15',amountPaid='".$informationSheet['LabCharges']."',dateOfPayment='".$currDate."',createdUser='".$informationSheet['userId']."'");  

        }


        if($informationSheet['Others']){

            $oroQry = $db->qry("insert into InformationSheetPayments  set 
                                patientId = '".$patientid."',visitId='".$visitedid."',facilityGroupId='10',facilityId='16',amountPaid='".$informationSheet['Others']."',dateOfPayment='".$currDate."',createdUser='".$informationSheet['userId']."'");  

        }

       
       
    }

}

if($_GET['action'] === 'getDataOfVisit' && $_GET['visitId'] !== null) {

    $res = $db->qry("SELECT * FROM InformationSheet WHERE visitId = " . $_GET['visitId']);
    echo json_encode($res);
}

?>
