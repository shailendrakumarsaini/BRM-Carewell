angular.module('medwise').controller('blank_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);

	$scope.init=function(){
			$scope.action=1;
	$http.get("URL").then(function OnSuccess(res){
			$scope.data=res.data;
		 });
		$medwiseLog.save('Users','extra Data');
        
	}
	
});

