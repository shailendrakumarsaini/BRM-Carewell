angular.module('medwise').controller('staff_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.staff = {};
    $scope.update = [];

	$scope.init=function(){
        $scope.action=1;
        $http.get("../php/staff.php?action=all").then(function OnSuccess(res){
            $scope.staff_data = res.data;
            //console.log($scope.staff_data);
            if(Array.isArray($scope.staff_data)){
                for(var i in $scope.staff_data){
                    $scope.staff_data[i].staff_salary = Number($scope.staff_data[i].staff_salary);
                }
            }else{
                $scope.staff_data = [];
                $scope.NoData = 1;
            }
		 });
		$medwiseLog.save('Staff','Staff Loaded');
    }
    
    $scope.save_staff_data = function(){ 
        var data = $.param({ 
            staff_name : $scope.staff_name,
            staff_department : $scope.department, 
            staff_salary : $scope.salary 
        });
        var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
        $http.post("../php/staff.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
            //console.log(data.data);
            $route.reload();
            $medwiseLog.save('Staff','Staff Added');
        });
    }

    $scope.updateMenu = function(index){
        if($scope.update[index] != 1){
            $scope.update[index] = 1;
        } else {
            $scope.update[index] = 0;
         }
    }

    $scope.update_staff = function(i){
        var data = $.param({ 
            staff_name : i.staff_name,
            staff_department : i.staff_department, 
            staff_salary : i.staff_salary ,
            staff_id : i.staff_id
        });
        var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
        //console.log(data);
        $http.post("../php/staff.php?action=update", data, config).then(function OnSuccess(data, status, header, config) {
            //console.log(data.data);
            $route.reload();
            $medwiseLog.save('Staff','Staff Updated');
        });
    }
    
    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
            $medwiseLog.save('Sorted Data Loaded'); 
        }
	
});

