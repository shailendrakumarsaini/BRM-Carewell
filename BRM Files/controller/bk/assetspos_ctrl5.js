angular.module('medwise').controller('assetspo_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
	$scope.pos={};
	$scope.pos.items_list=[];


	$scope.init=function(){
			$scope.action=1;
	$http.get("../php/assets_pos.php?action=all").then(function OnSuccess(res){
			$scope.assets_pos=res.data;
		 });
		//$medwiseLog.save('Users','extra Data');
        
    }
    

	$scope.add_new_po=function(){
			$scope.action=2;
			$http.get("../php/supplier.php?action=supplier").then(function OnSuccess(res){
				$scope.suppliers=res.data;
			 });

	}
	$scope.add_item=function(){
				var items={
						item:'',
						mrp:'',
						pp:'',
						qty:'',
						amount:''

					
				}
		$scope.pos.items_list.push(items);


	}
	$scope.item_remove=function(idx,amount){
		$scope.pos.net_amount=$scope.pos.net_amount-amount;
			$scope.pos.items_list.splice(idx, 1);     
	}
	
	
});

