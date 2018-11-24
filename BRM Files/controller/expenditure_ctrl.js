angular.module('medwise').controller('expenditure_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.update = [];

	$scope.init=function(){
			$scope.action=1;
			$scope.exp = 0;
	$http.get("../php/expenditure_categories.php?action=all").then(function OnSuccess(res){
			$scope.all_exp_data=res.data;
			if(Array.isArray($scope.all_exp_data))
			{
				$scope.exp = 1;
			}
			else
			{
			$scope.exp = 2;
			$scope.all_exp_data = [];
			}
				
		 });
		$medwiseLog.save('Users','extra Data');
        
	}
	$scope.enable_exp = function(){
		$scope.action = 2;
	}
	$scope.save_expen = function(){
		
		//alert($scope.login_data.edwise.uid);
		var data = $.param({
			expCatName:$scope.expenditure,
			user_id: $scope.login_data.edwise.uid
			
		});
			
		 var log_data = data;
            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("../php/expenditure_categories.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
            //console.log(data.data);
            $scope.expenditure = '';
			$route.reload();
             });
	}
	$scope.update_expen = function(x){
		var data = $.param({
			user_id:$scope.login_data.edwise.uid,
			expCatId:x.expCatId,
			expCatName:x.expCatName
		});
		 var log_data = data;
            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("../php/expenditure_categories.php?action=update", data, config).then(function OnSuccess(data, status, header, config) {
             //console.log(data.data);
             $route.reload();
             });
    }
    
	 $scope.change_status = function (eid){
            $http.get("../php/expenditure_categories.php?action=change_status&expCatId=" + eid).then(function OnSuccess(res) {
                //console.log(res.data);
               $route.reload();
            });
        }

	$scope.all_reset = function()
	{
		for(var i in $scope.update){
            $scope.update[i] = 0;
        }
		$scope.action = 1;
	}
	
});

