angular.module('medwise').controller('specialities_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);

    $scope.init = function () {
        $scope.action = 1;
        $http.get("../php/specialities.php?specialities=all").then(function OnSuccess(res) {
            //console.log(res.data);
            $scope.spec_data = res.data;
            if(Array.isArray($scope.spec_data)) {
                $scope.noRecords = false;
            } else {
                $scope.noRecords = true;
                $scope.spec_data = [];
            }
        });
        $medwiseLog.save('Users', 'extra Data');
    }

    $scope.addspec = function () {
        $scope.action = 2;

        //$scope.user='';
        //$http.get("../php/login.php?levels=all").then(function OnSuccess(res){
        //$scope.levels=res.data;

        //});

    }

    $scope.save_spec = function () {
        var data = $.param({
            spname: $scope.spname,
            spdesc: $scope.spdesc
        });

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/specialities.php?act=add", data, config).then(function OnSuccess(data, status, header, config) {
            //$scope.result=data.data;
            //console.log(data.data);
            $scope.action = 1;
            $scope.init();
        });
             $scope.spname='';
             $scope.spdesc='';
    }
    $scope.get_spec_menu = function (sp_id) {
        $scope.result = "";
        if ($scope.menu_uid != sp_id)
            $scope.menu_uid = sp_id;
        else
            $scope.menu_uid = 0;
        $http.get("../php/specialities.php?specialities=yes&sp_id=" + sp_id).then(function OnSuccess(res) {
            $scope.sp = res.data;
            $scope.spec = $scope.sp[0];

        });

        $scope.update_spec = function (sp_id) {

            var data = $.param({
                spname: $scope.spec.spname,
                spdesc: $scope.spec.spdesc,
                spid: sp_id
            });

            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("../php/specialities.php?act=up", data, config).then(function OnSuccess(data, status, header, config) {
                $scope.result = data.data;
                //console.log(data.data);
            });

            location.reload();

        }

    }

    $scope.delete_spec = function (spid,stat) {
      $http.get("../php/specialities.php?act=del&delete_spid=" + spid +"&status="+stat).then(function OnSuccess(res) {
            $scope.result = res.data;
            $scope.init();
        });
    }



});
