angular.module('medwise').controller('assetspo_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.pos = {};
    $scope.pos.items_list = [];
    $scope.pos.net_amount = 0;
    $scope.pos.total_amount = 0;


    $scope.init = function () {
        $scope.action = 1;
        $http.get("../php/assets_pos.php?action=all").then(function OnSuccess(res) {
            $scope.assets_pos = res.data;
        });

      
        //$medwiseLog.save('Users','extra Data');

    }


    $scope.add_new_po = function () {
        $scope.action = 2;
        $scope.add_item();
        $http.get("../php/supplier.php?action=supplier").then(function OnSuccess(res) {
            $scope.suppliers = res.data;
        });

        $http.get("../php/assets.php?action=assets_list").then(function OnSuccess(res) {
            $scope.medunits_data = res.data;
        });




    }
    $scope.add_item = function () {
        var items = {
            //     mrp: '',
            //     qty: '',
            //     amount: '',
            //     finamount:''

        }
        $scope.pos.items_list.push(items);
    }


    $scope.save_asset_po_data = function () {
        alert("ok");
        var d = new Date($scope.pos.assetpo_date);
        var dob = d.getFullYear() + '/' + (parseInt(d.getMonth()) + 1) + '/' + d.getDate();


        var data = $.param({
            asset_pos: $scope.pos
        });
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/assets_pos.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
            console.log(data.data);
            $scope.action = 1;
            //location.reload();
            console.log(data);

        });
    }

    $scope.get_tax = function (x) {

        //alert(x);
        var tax = $filter('filter')($scope.medunits_data, {
            asset_id: x
        });
        return tax[0].tax_percent;

    }

    $scope.get_cal = function (idx) {

        console.log(idx);

        $scope.pos.items_list[idx].amount = $scope.pos.items_list[idx].apo_pp * $scope.pos.items_list[idx].apo_qty;
        $scope.pos.items_list[idx].amount_tax = $scope.pos.items_list[idx].amount + ($scope.pos.items_list[idx].amount * ($scope.pos.items_list[idx].tax / 100));
        $scope.pos.net_amount = 0;
        $scope.pos.total_amount = 0;
        for (var i = 0; i < $scope.pos.items_list.length; i++) {
            $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
            $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;

        }


    }


    $scope.item_remove = function (idx, amount) {
        $scope.pos.net_amount = $scope.pos.net_amount - amount;
        $scope.pos.items_list.splice(idx, 1);


        $scope.pos.net_amount = 0;
        $scope.pos.total_amount = 0;
        for (var i = 0; i < $scope.pos.items_list.length; i++) {
            $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
            $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;

        }

    }

    //../php/assets_pos.php?action=asset_pod&asset_po_id=11


});
