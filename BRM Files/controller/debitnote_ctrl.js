angular.module('medwise').controller('debitnote_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    

	$scope.init = function(){ 
        // $scope.tempDateModelFromDate = new Date();
        // $scope.tempDateModelToDate = new Date();
        // $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        // $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
        // alert($scope.changeFromDateDate+"-----"+$scope.changeToDateDate);
        // $http.get("../php/case_sheet.php?action=specific_date_cs&from_date="+$scope.changeFromDateDate+"&to_date="+$scope.changeToDateDate).then(function OnSuccess(res) {
        //     console.log(res.data);
        // });
       
 
        // $http.get("../php/supplier.php?action=all").then(function OnSuccess(res){
        //     $scope.unit_data = res.data;
        //     if(Array.isArray($scope.unit_data)){
        //         $scope.NoData = 0;
        //     }else{
        //         $scope.unit_data = [];
        //         $scope.NoData = 1;
        //     }

        // });
        
        $scope.action=1;
		$medwiseLog.save('Users','extra Data');  
    }  

    $scope.byDate = function()
    {
        $scope.changeFromDateDate = $scope.tempDateModelFromDate.toLocaleDateString('en-US',{day:'2-digit', month:'long', year:'numeric'});
        $scope.changeToDateDate = $scope.tempDateModelToDate.toLocaleDateString('en-US',{day:'2-digit', month:'long', year:'numeric'});
        alert($scope.changeFromDateDate+"-----"+$scope.changeToDateDate);
        // $http.get("../php/case_sheet.php?action=specific_date_cs&from_date="+$scope.changeFromDateDate+"&to_date="+$scope.changeToDateDate).then(function OnSuccess(res) {
        //     console.log(res.data);
        // });
    }

	
});







