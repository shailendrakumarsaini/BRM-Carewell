angular.module('medwise').controller('patientregistration_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog) {
    // $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    // $scope.level = parseInt($scope.login_data.edwise.level);

    $scope.init = function () {
        $scope.action = 1;
        $http.get("../php/registration.php?action=all").then(function OnSuccess(res) {
            $scope.data = res.data;
            //console.log(res.data);
        });
        //$medwiseLog.save('Users','extra Data');

    }

    $scope.save = function () {


        var params = $.param({


            name_first: $scope.name_first,
            name_middle: $scope.name_middle,
            name_last: $scope.name_last


        });

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/registration.php?action=save", params, config).then(function OnSuccess(res, status, header, config) {
            $scope.result = res.data;
            //console.log(res.data);

            //$scope.action = 1;
            //$scope.init();
        });

    }

});
