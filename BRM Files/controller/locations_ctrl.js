angular.module('medwise').controller('locations_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);

    $scope.init = function () {
        $scope.action = 1;
        $http.get("../php/locations.php?action=all").then(function OnSuccess(res) {
            $scope.locations = res.data;
            //console.log($scope.locations);
            if(Array.isArray($scope.locations)) {
				$scope.noRecords = false;
			} else {
				$scope.noRecords = true;
				$scope.locations = [];
			}
            //console.log($scope.locations);
        });

        $http.get("../php/fecilities.php?fecilities_group=all").then(function OnSuccess(res){
            //console.log(res.data);
                 $scope.fec_grps = res.data;
                 if(Array.isArray($scope.fec_grps)) {
                    $scope.noRecords = false;
                 } else {
                    $scope.noRecords = true;
                    $scope.fec_grps = [];
                 }
             });

        $http.get("../php/hospital.php?action=select_down").then(function OnSuccess(res) {
            $scope.hospitals = res.data;
            //console.log($scope.hospital);
        });
        $medwiseLog.save('Users', 'extra Data');

    }

    $scope.change_status = function (locid, status, index) {

        if (status == 1)
            status = 0;
        else
            status = 1;
        $scope.locations[index].status = status;
        $http.get("../php/locations.php?act=st&status=" + status + "&loc_id=" + locid).then(function OnSuccess(res) {
            //console.log(res.data);
        });

    }

    $scope.add_location = function () {
        $scope.action = 2;
    }

    $scope.save_location = function () {
        var data = $.param({
            loc_code: $scope.loc_code,
            block_name: $scope.block_name,
            loc_name: $scope.loc_name,
            hosp_id: $scope.hosp_id,
            fcgid: $scope.fcgid
        });

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/locations.php?act=add", data, config).then(function OnSuccess(data, status, header, config) {
            $scope.result = data.data;
            //console.log(data.data);
            $scope.action = 1;
            $scope.init();
        });

    }


    $scope.getlocation = function (locid) {
        $scope.result = "";
        if ($scope.menu_uid != locid)
            $scope.menu_uid = locid;
        else
            $scope.menu_uid = 0;

        $http.get("../php/locations.php?loc=yes&locid=" + locid).then(function OnSuccess(res) {
            //console.log(res.data);
            $scope.fc = res.data;
            $scope.loca_data = $scope.fc[0];
        });
        $http.get("../php/hospital.php?action=select_down").then(function OnSuccess(res) {
            $scope.hospitals = res.data;
            //console.log($scope.hospital);
        });

        $scope.update_location = function (locid) {
            var data = $.param({
                loc_code: $scope.loca_data.loc_code,
                block_name: $scope.loca_data.block_name,
                loc_name: $scope.loca_data.loc_name,
                hosp_id: $scope.loca_data.hosp_id,
                locid: locid,
                fcgid: $scope.loca_data.fcgid,
            });

            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("../php/locations.php?act=updloc", data, config).then(function OnSuccess(data, status, header, config) {
                $scope.result = data.data;
                //console.log(data.data);
            });

            location.reload();

        }

    }
    $scope.delete_location = function (loc_id) {
        $http.get("../php/locations.php?act=del&loc_id=" + loc_id).then(function OnSuccess(res) {
            $scope.result = res.data;
            $scope.init();
        });
    }

});
