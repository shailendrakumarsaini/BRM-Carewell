angular.module('medwise').controller('scheme_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.scheme = {};
    $scope.update = [];

	$scope.init=function(){
		$scope.action=1;
	    $http.get("../php/schemes.php?action=all").then(function OnSuccess(res){
            $scope.scheme_data = res.data;
            //console.table($scope.scheme_data);
            if(Array.isArray($scope.scheme_data)){
                $scope.NoData = 0;
            }else{
                $scope.scheme_data = [];
                $scope.NoData = 1;
            }
		 });
		$medwiseLog.save('Users','extra Data');
    }
    
    $scope.updateFun = function(index){
        if($scope.update[index] != 1){
            $scope.update[index] = 1;
            //alert($scope.update[index]);
        }else{
            $scope.update[index] = 0;
            //alert($scope.update[index]);
         }
    }

    
    $scope.save_scheme_data = function(){
        $scope.scheme.user_id = $scope.login_data.edwise.uid;
        //console.log($scope.scheme);
        var data = $.param({ scheme: $scope.scheme});
        var config = { headers: { 'Content-Type':'application/x-www-form-urlencoded;charset:utf-8;' } }
        $http.post("../php/schemes.php?action=add",data,config).then(function OnSuccess(data,status,header,config){
           // console.log(data.data);
            $route.reload();
        });
    }

    $scope.update_scheme = function (i){
        i.user_id = $scope.login_data.edwise.uid;
        //console.log(i);
        var data = $.param({ scheme: i});
        var config = { headers: { 'Content-Type':'application/x-www-form-urlencoded;charset:utf-8;' } }
        $http.post("../php/schemes.php?action=update",data,config).then(function OnSuccess(data,status,header,config){
            //console.log(data.data);
            $route.reload();
        }); 
    }

    $scope.Home = function(){
        for(var i in $scope.update){
            $scope.update[i] = 0;
        }
        $scope.action = 1;
    }

});

