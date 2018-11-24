angular.module('medwise').controller('dashboard_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog, $location) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.currentDate = new Date();
    $scope.inpatient_data = {};
    $scope.myObj = [];
    $scope.pre_index = "";
    $scope.beds_show = 0;
    $scope.consult_show = 0;
    $scope.total_amount = ''; 
 
    // $scope.OpenModalFun = function(bcgroup,id){
    //     alert(bcgroup);
    //     if(bcgroup == 'Hospital'){
    //         $("#modal"+id).attr("data-toggle", "modal");
    //         $("#modal"+id).attr("data-target", "#modal0");
    //         $("#modal"+id).trigger("click");
    //     }
    //     if(bcgroup == 'Labs'){
    //         $("#modal"+id).attr("data-toggle", "modal");
    //         $("#modal"+id).attr("data-target", "#modal1");
    //         $("#modal"+id).trigger("click");
    //     }
    //     if(bcgroup == 'Pharmacy'){
    //         $("#modal"+id).attr("data-toggle", "modal");
    //         $("#modal"+id).attr("data-target", "#modal2");
    //         $("#modal"+id).trigger("click");
    //     }
    // }

    $scope.init=function()
        { 
			 $scope.sch = 1;
            $http.get("../php/consultation_rooms.php?action=outpatient_count").then(function OnSuccess(res){
                $scope.consult_count = res.data;
                //console.log($scope.consult_count);
            });
            $http.get("../php/inpatient.php?action=inpatient_count").then(function OnSuccess(res){
                $scope.inpatient_count = res.data;
                //console.log($scope.consult_count);
            });
            $http.get("../php/dashboard.php?action=get_total_income").then(function OnSuccess(res){
                $scope.income_details = res.data[0];
                //console.table($scope.income_details);
            });
            $http.get("../php/dashboard.php?action=get_individual_income").then(function OnSuccess(res){
                $scope.full_income = res.data;
			});
			$http.get("../php/payments.php?action=total").then(function OnSuccess(res){
                $scope.total_expenditure = res.data;
                //console.log($scope.total_expenditure);
            });
			$http.get("../php/dashboard.php?action=get_inpatient_count_by_scheme_wise").then(function OnSuccess(res){
                $scope.details_schemes_data = res.data;
                //console.log($scope.scheme_name);
            });
            $http.get("../php/dashboard.php?action=get_pharmacy_amount").then(function OnSuccess(res){
                $scope.pharmacy_data = res.data;
                //console.log($scope.pharmacy_data);
            });
            $http.get("../php/dashboard.php?action=get_test_count_of_op_patients").then(function OnSuccess(res){
                $scope.op_patient = res.data;
                //console.log($scope.op_patient);
            });
            $medwiseLog.save('InPatient','Getting Total Out Patients');
        }

    $scope.income = function(){
        $http.get("../php/dashboard.php?action=income").then(function OnSuccess(res){
            $scope.income_data=res.data;
            if(!Array.isArray($scope.income_data)){
                $scope.NoDataforIncome = 1;
            }
            //console.log($scope.income_data);
        });
    }

    $scope.Expenditure = function(){
        $http.get("../php/dashboard.php?action=expenditure").then(function OnSuccess(res){
            $scope.expenditure_data=res.data;
            if(!Array.isArray($scope.expenditure_data)){
                $scope.NoDataforExpenducture = 1;
            }
            //console.log($scope.expenditure_data);
        }); 
    }

    $scope.Home = function(){
            $scope.beds_show = 0;
            $scope.consult_show =0;
			$scope.sch = 1;
        }
  
    $scope.getbeds = function(){
        if($scope.beds_show == 0){
                $http.get("../php/beds.php?act=for_bed_allocation").then(function OnSuccess(res){
                    $scope.data=res.data;
                    //console.log($scope.data);
                });
            $scope.consult_show = 0;
            $scope.beds_show = 1;
            } else{
                $scope.beds_show = 0;
            }
			 $scope.sch = 1;
        $medwiseLog.save('InPatient','Getting Beds');
    }

    $scope.getConsult = function() {
        if($scope.consult_show == 0) {
            $http.get("../php/consultation_rooms.php?action=consultation_rooms").then(function OnSuccess(res){
                $scope.consult_data = res.data;

                if(Array.isArray($scope.consult_data)) {
                    $scope.beds_show = 0;
                    $scope.consult_show = 1;
                }
            });
        } else {
            $scope.consult_show = 0;
        }
		 $scope.sch = 1;
        $medwiseLog.save('InPatient','Getting Consult');
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
   
    function isEmpty(obj) {
        for(var key in obj) {
            if(obj.hasOwnProperty(key))
                return false;
        }
        return true;
    }
 $scope.get_schmes_count = function()
 {
	 if($scope.sch == 1)
	 {
	 $scope.sch = 2;
	 }
	 else
	 {
		 $scope.sch = 1;
	 }
	 $scope.beds_show = 0;
    $scope.consult_show = 0;
 }
 $scope.get_schemes_details = function(scid)
 {
	 $http.get("../php/dashboard.php?action=get_patient_details_by_scheme_wise&scheme_id=" + scid).then(function OnSuccess(res){
                $scope.get_schemes_details_data = res.data;
				$scope.scheme_name = $scope.get_schemes_details_data[0].schemeName;
                console.log($scope.get_schemes_details_data);
            });
	 
 }

});
