angular.module('medwise').controller('assetinward_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);

	$scope.init=function(){
			$scope.action=1;
	$http.get("../php/assets_pos.php?action=all").then(function OnSuccess(res){
			$scope.unit_data=res.data;
		 });
		$medwiseLog.save('Users','extra Data');
        
	}
	
		$scope.save = function () 
	    {
				alert("Save Button Pressed");
				
		}
	
});

