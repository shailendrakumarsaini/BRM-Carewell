angular.module('medwise').controller('assets_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog,$location) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.selected_data = {};
    $scope.update = [];
 

    $scope.Home = function(){
       $scope.update = [];
       $scope.action = 1;
    }


    $scope.init = function () {
        $scope.action = 1; 
        $http.get("../php/assets.php?action=all").then(function OnSuccess(res) {
            $scope.unit_data = res.data;
            //console.log($scope.unit_data);   
            if(Array.isArray($scope.unit_data)){
                $scope.NoData = 0;
                for (var ind in $scope.unit_data) {
                    $scope.unit_data[ind].asset_id = Number($scope.unit_data[ind].asset_id);
                }    
            }else{
                $scope.unit_data = [];
                $scope.NoData = 1;
            }            
        });
        $http.get("../php/item_group.php?action=all_except_medicals").then(function OnSuccess(res) {
            $scope.unit1_data = res.data;
        });
        $http.get("../php/assets.php?action=units").then(function OnSuccess(res) {
            $scope.unit2_data = res.data;
			//console.table($scope.unit2_data);
        });
        $http.get("../php/assets.php?action=taxes").then(function OnSuccess(res) {
            $scope.unit3_data = res.data;
        });

        $medwiseLog.save('Assets', "Assets is opened");
    }

    $scope.SortTheData = function (temp) {
        $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
        $scope.sort = temp;
    }

    $scope.updateFun = function(asset_id, obj){
        if($scope.update[asset_id] != 1){
            $scope.update[asset_id] = 1;
        }else{   
            $scope.update[asset_id] = 0;
        }

        $scope.selected_data.unit_obj = obj;
    }


    $scope.save = function () {
        var data = $.param({
            asset_name: $scope.asset_name,
            asset_group_id: $scope.asset_group_id,
            asset_brand: $scope.asset_brand,
            asset_desc: $scope.asset_desc,
            asset_units: $scope.selected_data.unit_obj.unit_id, 
            asset_tax: $scope.asset_tax
        });
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/assets.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
            //console.log(data.data);
            $route.reload();
            $scope.action = 1;
            //console.log(data);
        });
        $medwiseLog.save('Assets', data);
    }

    $scope.update_data = function (x) {
        var data = $.param({
            asset_id: x.asset_id,
            asset_name: x.asset_name,
            asset_group_id: x.asset_group_id,
            asset_brand: x.asset_brand,
            asset_desc: x.asset_desc,
            asset_units: $scope.selected_data.unit_obj.unit_id,
            asset_tax: x.asset_tax
        });

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/assets.php?action=update", data, config).then(function OnSuccess(data, status, header, config) {
            $scope.result = data.data;
            //console.log(data);
        });
        $route.reload();
        $medwiseLog.save('Assets', data);
    }


    $scope.change_status = function (asset_id, asset_status, index) {
        $http.get("../php/assets.php?action=update_status&assets_id=" + asset_id).then(function OnSuccess(res) {
            //console.log(res.data);
            //swal("Successfully Updated");
        });
        $route.reload();
        $medwiseLog.save('Assets', 'asset_id = ' + asset_id + ', asset_status = ' + asset_status);
    }

});
