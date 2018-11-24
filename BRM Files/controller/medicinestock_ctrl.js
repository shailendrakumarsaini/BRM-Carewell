angular.module('medwise').controller('medicinestock_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog,$location) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);

	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var todayDateString = year + "-" + month + "-" + day;
	$scope.todayDate = new Date(todayDateString);

    $scope.redirectHome = function(){
        $location.path('dashboard');
    }

	$scope.init=function(){
        $http.get("../php/store.php?action=all").then(function OnSuccess(res) {
            $scope.store = res.data;
            if(Array.isArray($scope.store)) {
                $scope.store_id = $scope.store[0].id;
                $scope.show_items($scope.store_id);
            }
        }); 
	    $scope.action=1;
		$medwiseLog.save('Medicine Stock');
    }
    
    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }

	$scope.compareDates= function(expiryDate) 
		{
            var expiryDateObj = new Date(expiryDate);
            
            if($scope.todayDate > expiryDateObj) {
                return 'red';
            }
			//console.log(expiryDateObj);
			var oneMonthMinusExpiryDate = new Date(expiryDateObj.setMonth(expiryDateObj.getMonth() - 1));
			//console.log(oneMonthMinusExpiryDate);
			//console.log($scope.todayDate);
			//console.log('Break');
			if ($scope.todayDate < oneMonthMinusExpiryDate)
				{
					return 'black';
				} 
			else
				{
					return 'orange';
				}
		}

    $scope.show_items = function(store_id)
    {
	    $http.get("../php/medicine_stock_register.php?action=specific_store&store_id="+store_id).then(function OnSuccess(res){
        $scope.med_stock_data=res.data;	
        $scope.search = '';	
			if(!Array.isArray($scope.med_stock_data))
				{
                    $scope.med_stock_data = [];
					$scope.no_record = 1;
                    $scope.test = 1;
                    $scope.change = 0;
				}
			else
				{
					$scope.test = 1;
                    $scope.no_record = 0;
                    $scope.change = 1;
				} 
		});
    }
    
	
});

