angular.module('medwise').controller('inpatient_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog,$location) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.inpatient_data = {};
    $scope.myObj = [];
    $scope.pre_index = "";
    $scope.Beds = 0;
    $scope.showww = 0;
    $scope.totalPackage = '';
    $scope.advAmount = '0';
    $scope.surgen = ''; 
    $scope.anesthesia = '';
    $scope.inpatient_data.no_of_days = '';
    
        //console.log($scope.login_data.edwise['uid']); 
        // $window.sessionStorage.setItem("key","value");
        // $window.sessionStorage.getItem("key"); 

    


    $scope.init=function()
        { 
            $scope.action=1;
            // $scope.admission = new Date();
            // $scope.inpatient_data.admission_date = $scope.admission.toLocaleDateString('en-US',{ day:'2-digit', month:'long', year:'numeric' });
            $scope.temp = new Date();
            $scope.admission = $scope.temp.toLocaleDateString('en-GB',{ day:'numeric', month:'numeric', year:'numeric' });
            var splitDate = $scope.admission.split("/");
		    $scope.inpatient_data.admission_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
            $scope.hold = $window.sessionStorage.getItem('patient_id');
            $scope.p_visit_id = $window.sessionStorage.getItem('p_visit_id');
            $scope.doctor_id = $window.sessionStorage.getItem('dr_id');
            $scope.inpatient_data.dr_id = $scope.doctor_id;
            //alert(" value in inPatient " + $scope.Hold_doctor_id);

            $http.get("../php/beds.php?act=for_bed_allocation").then(function OnSuccess(res)
                {
                    $scope.data=res.data;
                    //console.table($scope.data);
                });
            $http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res){
                    $scope.doctors_data=res.data;
                    //console.table($scope.doctors_data);
                });
            $http.get("../php/schemes.php?action=all").then(function OnSuccess(res){
                    $scope.scheme_data=res.data;
                    //console.table($scope.scheme_data);
                });
            $http.get("../php/inpatient.php?action=special").then(function OnSuccess(res){
                $scope.department_data = res.data;
                //console.log($scope.department_data);
            });
            $http.get("../php/patient_info.php?action=patient_details&patient_id=" + $scope.hold).then(function OnSuccess(res)
                {
                    $scope.patient_basic_data=res.data;
                });
            $medwiseLog.save('InPatient','Getting Beds');

            $http.get("../php/beds.php?act=getFreeBeds").then(function OnSuccess(res) {
                $scope.beds = res.data;
            });
        }

    $scope.change_date = function() {
        $scope.inpatient_data.admission_date = $scope.admission.toLocaleDateString('en-US',{ day:'2-digit', month:'long', year:'numeric' });
            //alert($scope.inpatient_data.admission_date);
    }


    $(document).ready(function() {
        $("#admissionID").datepicker({ dateFormat : 'dd/mm/yy' });
    });

    $scope.changeDate_Through_UiJquery = function(admission) {
        var splitDate = admission.split("/");
		$scope.inpatient_data.admission_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
    }    
    
    $scope.Number_of_Days = function(no_of_days) {
        
        $scope.inpatient_data.no_of_days = no_of_days;
    }
  

        $scope.selectPackage = function(){
            if($scope.test1 == 'package'){
                $scope.showpackage = 1;
            }else{
                $scope.showpackage = 0;
            }
            $scope.inpatient_data.packOrReg = $scope.test1;
        
            $scope.totalPackage = "";
            //$scope.advAmount = "";
            $scope.totalPackages();
            //$scope.advAmounts();
            $medwiseLog.save('InPatient','To Select surgery');
        }

        $scope.selectAmount = function(x) {
            var amount=$filter('filter')($scope.beds,{'bed_id':x});
            $scope.inpatient_data.rentAmount = amount[0].rentAmount;
        }

        $scope.selectSurgery = function()
        {
            if($scope.test2 == 'surgery'){
                /*$http.get("../php/login.php?action=get_surgeory_doctors").then(function OnSuccess(res)
                    {
                        $scope.surgeory_doctors_data=res.data;
                        //console.table($scope.surgeory_doctors_data);
                    });
                $http.get("../php/login.php?action=get_anesthesia_doctors").then(function OnSuccess(res)
                    {
                        $scope.anesthesia_doctors_data=res.data;
                    });*/
                $scope.showSurgery = 1;
            }else{
                $scope.showSurgery = 0;
            }
            $scope.inpatient_data.surOrMed = $scope.test2;
            $scope.surgen = "";
            $scope.anesthesia = "";
            $scope.surgens();
            $scope.anesthesias();
            $medwiseLog.save('InPatient','To Select surgery');
        }

    $scope.surgens = function (){
        $scope.inpatient_data.surgeon_dr_id = $scope.surgen;  
    }      
      
    $scope.anesthesias = function (){
        $scope.inpatient_data.anesthesia_dr_id = $scope.anesthesia;
    }

    $scope.totalPackages = function(){
        $scope.inpatient_data.totalPackage = $scope.totalPackage;
    }
       
    // $scope.advAmounts = function(){
    //     $scope.inpatient_data.advAmount = $scope.advAmount;
    //     // if(Number($scope.advAmount) <= Number($scope.totalPackage)){
    //     //     $scope.inpatient_data.advAmount = $scope.advAmount;
    //     // }else{
    //     //     swal("Advance Amount Must be Less Or Equal to Total Amount");
    //     //     $scope.advAmount = '';
    //     // }
    // }

    $scope.select_doctor = function()
        {
            $scope.inpatient_data.dr_id = $scope.doctor_id;
            $scope.test = $scope.doctor_id;
        }

    $scope.select_scheme = function(){
        $scope.inpatient_data.scheme_id = $scope.scheme_id;
    }

    $scope.placeToolTip = function(data) 
        {
            for(var block_index in data.blocks) 
            {
                for(var room_index in data.blocks[block_index].rooms) 
                {  
                    for(var bed_index in data.blocks[block_index].rooms[room_index].beds) 
                    {
                        if(data.blocks[block_index].rooms[room_index].beds[bed_index].patient_id !== "") 
                        {
                            $('#bed_' + data.blocks[block_index].rooms[room_index].beds[bed_index].bed_id).attr('data-toggle', 'tooltip');
                            $('#bed_' + data.blocks[block_index].rooms[room_index].beds[bed_index].bed_id).attr('data-placement', 'top');
                            $('#bed_' + data.blocks[block_index].rooms[room_index].beds[bed_index].bed_id).attr('data-title', 'Patient_id = ' + data.blocks[block_index].rooms[room_index].beds[bed_index].patient_id);
                            $('[data-toggle="tooltip"]').tooltip();
                        }
                    }
                }
            }
        }


        
    $scope.get_bed_id = function(b_id,rentAmount,is_allocated,idx)
        {
           // alert("patient id = " + $scope.hold + "   You Selected Bed ID " + b_id);
            if(is_allocated == 0 && $scope.hold != null)
                {    
                    if($scope.pre_index != "")
                        {
                             $scope.myObj[$scope.pre_index] = {"color" : "#27c24c"};   
                        }
                    $scope.inpatient_data.patient_id = $scope.hold;   
                    $scope.inpatient_data.bed_id = b_id;
                    $scope.inpatient_data.rentAmount = rentAmount;
                    $scope.myObj[idx] = {"color" : "#7f2c7f"};
                    $scope.pre_index = idx;
                }
            else if(is_allocated == 0 && $scope.hold == null)
                {
                    swal('Select Patient ID First');
                }
            else
                {
                    swal('Bed is Already Reserved');
                }
            $medwiseLog.save('InPatient','Bed Section');
        }



    $scope.allot_bed = function()
        {   
            // var date = new Date();
            // day = date.getDate();
            // if(day < 10){day = "0" + day;}
            // month = date.getMonth() + 1;
            // if(month< 10){month = "0" + month;}
            // year = date.getFullYear();
            // var admission = year +"-"+ month +"-"+ day;
            // $scope.admission = admission;

            // $scope.inpatient_data.admission_date = date.toLocaleDateString();

            /*if($scope.inpatient_data.dr_id == null || $scope.inpatient_data.dr_id == "") {
                swal("Select Doctor");
                return;
            }

            if($scope.test2 == undefined)
                {
                    swal("Choose Surgery or Medical");
                    return;
                }

            if($scope.showSurgery == 1)
                {
                    if($scope.test2 == 'surgery')
                        {
                            if($scope.surgen == '' || $scope.anesthesia == '')
                                {
                                    if($scope.surgen == "") {
                                        swal("Select Surgeon Doctor");
                                        return;
                                    } 
                                    else if($scope.anesthesia == "") {
                                        swal("Select Anesthesian Doctor");
                                        return;
                                    }
                                }
                        }
                }

            if($scope.test1 == undefined)
                {
                    swal("Choose package or regular");
                    return;
                }  

            if($scope.advAmount == "") {
                    swal("Enter Advance Amount");
                    return;
                }

            if($scope.test1 == 'package')
            {
                    if($scope.totalPackage == "")
                    {
                        if($scope.totalPackage == "") {
                            swal("Enter Total Package");
                            return;
                        } 
                    }                  
            }


            if($scope.inpatient_data.no_of_days == ""){
                swal("Fill No. Of Days Fields");
                return;
            }

            if($scope.showpackage == 1)
                {
                    if(Number($scope.totalPackage) < Number($scope.advAmount))
                        {
                            swal("Total Amount Not Less Then To Advance Amount");
                            $scope.totalPackage = '';
                            return;
                        }
                    else
                        {
                            $scope.inpatient_data.totalPackage = $scope.totalPackage;
                        }
                }

            if($scope.inpatient_data.bed_id == null || $scope.inpatient_data.bed_id == "") {
                swal("Select A Bed");
            }
            else
            {
                    $scope.inpatient_data.p_visit_id = $scope.p_visit_id;
                    $scope.inpatient_data.user_id = $scope.login_data.edwise['uid'];
                    var data = $.param({
                    inpatient_data : $scope.inpatient_data
                    });
                    //console.log($scope.inpatient_data);
                    var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
                    $http.post("../php/inpatient.php?action=add", data, config).then(function OnSuccess(res, status, header, config){
                        console.log(res.data);
                    }); 
                    //$window.location = '#/newpaitent';
                    //console.log(data);
                    $location.path("/newpaitent");
            }*/

            $scope.inpatient_data.p_visit_id = $scope.p_visit_id;
            $scope.inpatient_data.patient_id = $scope.hold;
            $scope.inpatient_data.user_id = $scope.login_data.edwise['uid'];
            var data = $.param({
            inpatient_data : $scope.inpatient_data
            });
            //console.log($scope.inpatient_data);
            var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
            $http.post("../php/inpatient.php?action=add", data, config).then(function OnSuccess(res, status, header, config){
                //console.log(res.data);
            });
            $location.path("/newpaitent");

            //$medwiseLog.save('InPatient','Allocate Bed');  
        }

        $scope.GotoNewPatient = function(){
            $location.path("/newpaitent");
        }

            function isEmpty(obj) {
                for(var key in obj) {
                    if(obj.hasOwnProperty(key))
                        return false;
                }
                return true;
            }

	
});

