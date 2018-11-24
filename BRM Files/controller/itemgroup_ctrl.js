angular.module('medwise').controller('itemgroup_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog,$location) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.is_medicine = 'Y';
    $scope.ig_asset = 'Y';

    $scope.Home = function(){
        $scope.menu_uid = 0;
        $scope.action = 1; 
    }


    $scope.init = function () {
        $scope.action = 1;
        $http.get("../php/item_group.php?action=all").then(function OnSuccess(res) {
            $scope.itemgroup_data = res.data;
            //console.log($scope.itemgroup_data);
            if(Array.isArray($scope.itemgroup_data)){
                $scope.NoData = 0;
            }else{
                $scope.itemgroup_data = [];
                $scope.NoData = 1;
            }
            $medwiseLog.save('Item Group', "Item Group is opened");
        });

    $scope.menu_uid_fun = function(ig_id){
        if($scope.menu_uid != ig_id)
        $scope.menu_uid = ig_id;
        else
        $scope.menu_uid = 0;  
    }
    
    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }

        $scope.get_group_menu = function (pt_id)
        {
            //$scope.result="";
            if ($scope.menu_uid != pt_id)
                $scope.menu_uid = pt_id;
            else
                $scope.patient_id = 0;
        }



        $scope.add_itemgroup = function () {

            // alert($scope.group_name);
            //$scope.status = 0;


            var data = $.param({
                ig_name: $scope.group_name,
                ig_asset: $scope.ig_asset,
                is_medicine: $scope.is_medicine
                //store_status: $scope.store_status


            });
            var log_data = data;
            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("../php/item_group.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
                //console.log(data.data);

                //$scope.action = 4;
                $route.reload();
                //$scope.op_patient = data.data.patnt;
                //$scope.op_hosp = data.data.hsp;
                //console.log(data);
            });

            $medwiseLog.save('Item Group', log_data);
        }


        $scope.change_status = function (ig_id, status, index) {
            //alert('im here' + id);
            $http.get("../php/item_group.php?action=update_status&item_group_id=" + ig_id).then(function OnSuccess(res) {
               // console.log(res.data);
                //console.log("sdfaasdlfasdf");

            });
            $route.reload();
            $medwiseLog.save('Item Group', 'ig_id = ' + ig_id + ', status = ' + status);
        }


        $scope.update_itemegroup = function (x) {
            //alert("im here");
            var data = $.param({
                ig_id: x.ig_id,
                ig_name: x.ig_name,
                ig_asset: x.ig_asset,
                is_medicine: x.is_medicine


            });

            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("../php/item_group.php?action=update", data, config).then(function OnSuccess(data, status, header, config) {

                //console.log(data.data);

                $scope.result = data.data;
                //console.log(data);

            });

            $route.reload();

        }

        $scope.add_inv_unit = function () 
        {
            $scope.action = 2;
            //$medwiseLog.save('Add Inv Unit', "");

        }


        /*$scope.countries = {
        	'No': {
        		'Yes': [''],
        		'No': ['']
        	},
        	'Yes': {
        		'NO': ['']
        	}
        };*/

    }

});
