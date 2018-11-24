angular.module('medwise').controller('payamount_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);

	
	$scope.action=1;
	$scope.search_patient_details = function (sname) {
		$scope.search_pt='';
        $http.get("../php/payamount.php?action=search_patient&sname="+sname).then(function OnSuccess(res) {
			//console.log(res.data);
            $scope.search_pt = res.data;			
			
        });
    }
	
	$scope.pay_patient_amount = function (pat_id,visittype) {
		$scope.action=2;
        $http.get("../php/payamount.php?action=get_payment_details&pat_id="+pat_id+"&visittype="+visittype).then(function OnSuccess(res) {
			//console.log(res.data);
            $scope.patient_info = res.data.patientinfo;	
			
			 $scope.fee_info = res.data.feeinfo;		
			
        });
    }
	
	
	
	$scope.save_bill_payment = function () {

        //alert($scope.pt_guardian_type);
        $scope.status = 0;

            var data = $.param({
                patient_info: $scope.patient_info,
                fee_info: $scope.fee_info,              
                pt_payment_type: $scope.pt_payment_type

            });
            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("../php/payamount.php?action=bill", data, config).then(function OnSuccess(data, status, header, config) {
                //console.log(data.data);
                $scope.action = 3;
                $scope.op_patient = data.data.patnt;
                $scope.op_hosp = data.data.hsp;
            });


    }
	
});

