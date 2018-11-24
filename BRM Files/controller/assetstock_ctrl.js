angular.module('medwise').controller('assetstock_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog,$location) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);

 
    $scope.init = function () 
    {
        $scope.action = 1;
        $scope.showTable = 0;
		 $http.get("../php/assets.php?action=store").then(function OnSuccess(res) {
            $scope.stock_data = res.data;
            $scope.store_name = $scope.stock_data[0].id;
            $scope.get_store_data($scope.store_name);
            //console.log($scope.stock_data);
        });  
       $medwiseLog.save('Asset Stock', 'Asset Stock Opened');
    }

	$scope.get_store_data = function(sid){
        if($scope.store_name != undefined){
            $scope.showTable = 1;
            $http.get("../php/asset_stock_register.php?action=specific_store&store_id=" + sid).then(function OnSuccess(res) {
                $scope.store_data = res.data;
                //console.log($scope.store_data);   
                if(Array.isArray($scope.store_data)){
                    $scope.NoData = 0;
                    for (i in $scope.store_data){
                        $scope.store_data[i].quantity = Number($scope.store_data[i].quantity);
                    }
                }else {
                    $scope.store_data = [];
                    $scope.NoData = 1;
                }
             });
        } else {
            $scope.showTable = 0;
        }
	   	
	}
    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }


});
