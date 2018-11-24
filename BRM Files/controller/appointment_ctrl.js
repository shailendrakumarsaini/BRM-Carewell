angular.module('medwise').controller('appointment_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog,$location) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.appointment = {};
    $scope.showDoctor = 0;
    // $scope.date_model = new Date();
	// $scope.appoint_date = $scope.date_model.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });


	$scope.init=function(){
        $scope.date_model = new Date();
        $scope.appoint_date = $scope.date_model.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        //alert($scope.appoint_date)
        // $http.get("URL" + $scope.appoint_date).then(function OnSuccess(res){
        //         $scope.appointment_data = res.data;
        //         if (!Array.isArray($scope.appointment_data)) {
        //             $scope.appointment_data = [];
        //             $scope.NoData = 1;
        //         } 
		// 	});
		$medwiseLog.save('Users','extra Data');
        $scope.action=1;
    }

    $scope.add_appointment = function(){
        $scope.date_model_for_appointment = new Date();
        $scope.appointment.appointment_date = $scope.date_model_for_appointment.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        //alert($scope.appoint_date)
        $http.get("../php/fecilities.php?fecilities=all").then(function OnSuccess(res) {
            $scope.services_data = res.data;
            //console.log($scope.services_data);
            if (!Array.isArray($scope.services_data)) {
                $scope.services_data = [];
            } 
        });
        $http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res){
            $scope.Doctors = res.data;
            });
        $scope.action = 2;
    }
    
    // $scope.change_date = function(){
    //     $scope.appoint_date = $scope.date_model.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
    //     $http.get("URL" + $scope.appoint_date).then(function OnSuccess(res){
    //             $scope.appointment_data = res.data;
    //             if (!Array.isArray($scope.appointment_data)) {
    //                 $scope.appointment_data = [];
    //                 $scope.NoData = 1;
    //             } 
	// 		});
	// 	$medwiseLog.save('Users','extra Data');
    // }

	$scope.autosearch_data = function (temp) {
        $http.get("../php/patient_info.php?action=inpatient_search&search_string=" + temp).then(function OnSuccess(res) {
            $scope.collection_data = res.data;
            //console.log($scope.collection_data);
            if (!Array.isArray($scope.collection_data)) {
                $scope.collection_data = [];
            } 
        });
    }

    $scope.change_date_for_appointment = function(){
        $scope.appointment.appointment_date = $scope.date_model_for_appointment.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
    }

    $scope.Select_Patient = function(temp){
        $scope.appointment.patient_id = temp;
    }

    $scope.select_service = function(temp){
        $scope.appointment.service_name = temp.fcname;
        $scope.appointment.service_id = temp.fcid;
        if($scope.appointment.service_name == 'OP Consultation'){
            $scope.showDoctor = 1;
        } else {
            $scope.showDoctor = 0;
        }
    }

    $scope.moveToNewPatientPage = function(){
        $location.path('newpaitent');
    }

    $scope.save_appointment = function(){
        var data = $.param({ appointment : $scope.appointment });
        var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
        $http.post("URL", data, config).then(function OnSuccess(data, status, header, config) {
            console.log(data.data);
            $route.reload();
            $scope.action = 1;
        });
    }


});

