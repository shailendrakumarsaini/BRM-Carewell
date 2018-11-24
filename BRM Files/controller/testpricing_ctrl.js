angular.module('medwise').controller('testpricing_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.test_pricing = {};

	$scope.init=function(){
		$scope.action=1;
	    $http.get("../php/test_pricing.php?action=get_test_pricing_data").then(function OnSuccess(res){
            $scope.test_data=res.data;
            //console.log($scope.test_data);
            if(Array.isArray($scope.test_data)){
                $scope.NoData = 0;
            }else{   
                $scope.test_data = [];
                $scope.NoData = 1;
            }
            //console.table($scope.test_data);
		 });
		$medwiseLog.save('Users','extra Data'); 
    }

    $scope.updateFun = function(test_id){
        if($scope.update != test_id)
            $scope.update = test_id;
        else
        $scope.update = 0;
    }

    $scope.gotoNewPage = function(){
        $scope.action = 2;
        $http.get("../php/lab_tests.php?action=get_unpriced_tests").then(function (res){
            $scope.getTests = res.data;
            //console.table($scope.getTests);
        });
    }
    
    $scope.addTest = function()
        {
            $scope.test_pricing.user_id = $scope.login_data.edwise.uid;
            var data = $.param({
                test_pricing :$scope.test_pricing
            });
            var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
            $http.post("../php/test_pricing.php?action=add",data,config).then(function OnSuccess(data,status,header,config){
                //console.log(data.data);
                $route.reload();
            });
            $medwiseLog.save('Users','extra Data');
        }

    $scope.updateTest = function(i)
        {
            i.user_id = $scope.login_data.edwise.uid;
            var data = $.param({
                test_pricing : i
            });
            var config = { headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
            $http.post("../php/test_pricing.php?action=update",data,config).then(function OnSuccess(data,status,header,config){
                //console.log(data.data);
                $route.reload();
            });
            $medwiseLog.save('Users','extra Data');
        }

    $scope.Home = function(){
        $scope.update = 0;
        $scope.action = 1;
    }
    

});

