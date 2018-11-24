angular.module('medwise').controller('stores_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog, $location) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.store_data = [];

    $scope.Home = function(){
        $scope.menu_uid= 0;
        $scope.action = 1;
    }

    $scope.menu_uidFun = function(id){
        if($scope.menu_uid != id){
            $scope.menu_uid = id;
        }else{
            $scope.menu_uid = 0;
        }
    }

    $scope.init = function () {
        $scope.action = 1;
        $http.get("../php/store.php?action=all").then(function OnSuccess(res) {
            $scope.unit_data = res.data;
            //console.log(res.data);
            if(Array.isArray($scope.unit_data)){
                $scope.NoData = 0;
            }else{
                $scope.unit_data = [];
                $scope.NoData = 1;
            }
        });
        $http.get("../php/locations.php?action=all").then(function OnSuccess(res) {
            $scope.locations_data = res.data;
            	//console.log($scope.locations_data);
        });
        $medwiseLog.save('Stores', "Stores is opened");  
    }

    $scope.SortTheData = function (temp) {
        $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
        $scope.sort = temp;
        $medwiseLog.save('Stores', "Sorted Data");
    }

    // $scope.test = function (drug) 
    // {
    //     $scope.menu_uid = drug;
    //     $http.get("../php/store.php?action=specific_store&id=" + drug).then(function OnSuccess(res) {
    //         $scope.updat_data = res.data;
    //         $scope.drug_no = $scope.updat_data[0].drug_no;

    //     });
    // }


    $scope.add_store = function () {
        var data = $.param({
            store_type: $scope.store_type,
            store_name: $scope.store_name,
            store_account_group: $scope.store_group,
            tin_no: $scope.store_tin,
            drug_no: $scope.store_dln,
            is_super_store: $scope.store_super,
            sales_unit: $scope.sales_unit,
            location_id: $scope.location
        });
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/store.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
            //console.log(data.data);
            $route.reload();
        });
        $medwiseLog.save('Stores Data Added', data);
    }

    $scope.get_patient_menu = function (pt_id) {
        if ($scope.menu_uid != pt_id)
            $scope.menu_uid = pt_id;
        else
            $scope.patient_id = 0;
        $medwiseLog.save('Get Patient Menu', pt_id);
    }


    $scope.change_status = function (id, status, index) {
        $http.get("../php/store.php?action=update_status&store_id=" + id).then(function OnSuccess(res) {
            //console.log(res.data);
        });
        $route.reload();
        $medwiseLog.save('Stores', 'store_id = ' + id + ', status = ' + status);
    }


    $scope.update_hospital = function (x) {
        var data = $.param({
            id: x.id,
            store_type: x.store_type,
            store_name: x.store_name,
            store_account_group: x.store_account_group,
            tin_no: x.tin_no,
            drug_no: x.drug_no,
            is_super_store: x.is_super_store,
            sales_unit: x.sales_unit,
            location_id: x.location_id

        });

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/store.php?action=update", data, config).then(function OnSuccess(data, status, header, config) {

            //console.log(data.data);

            $scope.result = data.data;
            //console.log(data);

        });
        $route.reload();
        $medwiseLog.save('Stores Data Updated', data);
    }


    $scope.add_inv_unit = function () {
        $scope.action = 2;
        $scope.hide = 1;
        $medwiseLog.save('Add Unit');
    }

    $scope.changeValue = function (temp) {
        if ($scope.sales_unit == 'Yes') {
            $scope.hide = 0;
            //document.getElementById("store_group").required = true;
            //document.getElementById("store_dln").required = true;
            //document.getElementById("store_tin").required = true;  
            // $scope.store_group ='';
            // $scope.store_dln ='';
            // $scope.store_tin ='';
        } else {
            $scope.hide = 1;
            //document.getElementById("store_group").required = false;
            //document.getElementById("store_dln").required = false;
            //document.getElementById("store_tin").required = false;
            //$scope.store_group =0;
            //  $scope.store_dln =0;
            //  $scope.store_tin =0; 
        }
    }


    $http.get("../php/store.php?action=organization").then(function OnSuccess(res) {
        $scope.organization_data = res.data;
    });





});
