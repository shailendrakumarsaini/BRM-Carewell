angular.module('medwise').controller('pharmacyaccount_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.show = 0;


	$scope.init=function(){
		$scope.action=1;
		$medwiseLog.save('Users','extra Data');
    }
    
    $scope.autosearch_data = function (temp) {
        $http.get("../php/patient_info.php?action=inpatient_search&search_string=" + temp).then(function OnSuccess(res) {
            $scope.patient_data = res.data;
            //console.log($scope.patient_data);
            if (Array.isArray($scope.patient_data)) {
                //$scope.show = 1;
            } else {
                $scope.patient_data = [];
                //$scope.show = 0;
            }
        });
        $scope.search = '';
    }

    $scope.ShowTable = function(patient_id){
        $http.get("../php/patient_info.php?action=patient_details&patient_id=" + patient_id).then(function OnSuccess(res) {
            $scope.patient_details = res.data;
            //console.table($scope.patient_details);
        });
        $http.get("../php/collection.php?action=get_latest_visit&patient_id=" + patient_id).then(function OnSuccess(res) {
            $scope.patient_visit_details = res.data;
            //alert(res.data[0].p_visit_id);
            //console.log($scope.patient_visit_details);
            $http.get("../php/pharmacy_pro_loss.php?action=get_all_transactions&visit_id=" + res.data[0].p_visit_id).then(function OnSuccess(res) {
                $scope.transactions_details = res.data;
                if (Array.isArray($scope.transactions_details)) {
                    $scope.show_transactions_details = 1;
                } else {
                    $scope.show_transactions_details = 0;
                }
                //console.log($scope.transactions_details);
            });
            $http.get("../php/pharmacy_pro_loss.php?action=get_pharmacy_loss_or_profit&visit_id=" + res.data[0].p_visit_id).then(function OnSuccess(res) {
                $scope.profit_loss = res.data;
                if (Array.isArray($scope.profit_loss)) {
                    $scope.show_profit_loss = 0;
                } else {
                    $scope.show_profit_loss = 1;
                }
                //console.log($scope.profit_loss);
            });
        });
        $scope.show = 1;
    }

    $scope.Home = function(){
        $scope.show = 0;
        $scope.action = 1;
    }
	
});

