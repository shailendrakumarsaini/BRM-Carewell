angular.module('medwise').controller('patientlist_ctrl', function ($scope, $http, $filter, $window, $route, $medwiseLog) {
    $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.action = 'oplist';

    $scope.init = function () {



    }
    $scope.oplist = function () {
        $scope.action = 'oplist';
    }
    $scope.casualty = function () {
        $scope.action = 'casualty';
    }
    $scope.iplist = function () {
        $scope.action = 'iplist';
    }

});
