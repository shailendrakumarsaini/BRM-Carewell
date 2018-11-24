angular.module('medwise').controller('outpatient_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);
    $scope.myArray = [1,2,3,4,5];
    $scope.patientStr = 7;
    $scope.doctorName = "Rajesh";



    $scope.init=function()
        {
            $scope.action=1;
            $http.get("URL").then(function OnSuccess(res)
            {
                $scope.data=res.data;
            });
            $medwiseLog.save('OutPatient','OutPatient Data Loaded');
        }
	
});

