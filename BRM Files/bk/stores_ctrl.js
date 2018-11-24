angular.module('medwise').controller('stores_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);

	$scope.init=function(){
		$scope.action = 1;
		$http.get("../php/outpatient.php?action=all").then(function OnSuccess(res) {
			$scope.unit_data = res.data;
		});


		$scope.visit_form = 0;
		$scope.change_pat_data = function (typ) {

			if (typ == 'Mr.') {
				$scope.pt_gender = 'Male';
				$scope.pt_guardian_type = 'S/O';
				$scope.pt_martial_status = 'Married';
			} else if (typ == 'Mrs.') {
				$scope.pt_gender = 'Female';
				$scope.pt_guardian_type = 'W/O';
				$scope.pt_martial_status = 'Married';
			} else if (typ == 'Ms.') {
				$scope.pt_gender = 'Female';
				$scope.pt_guardian_type = 'D/O';
				$scope.pt_martial_status = 'Unmarried';
			}

			//alert($scope.pt_guardian_type); 			
		}

		$scope.add_patient = function () {

			//alert($scope.pt_guardian_type);
			$scope.status = 0;



			if ($scope.status == 0) {
				var data = $.param({
					pat: $scope.pat,
					pt_age: $scope.pt_age,
					pt_city: $scope.pt_city,
					mobile: $scope.mobile,
					whatsapp: $scope.whatsapp,
					pt_type: $scope.pt_type,
					pt_gender: $scope.pt_gender,
					pt_guardian_type: $scope.pt_guardian_type,
					pt_martial_status: $scope.pt_martial_status,
					referral: $scope.referral,
					consultant: $scope.consultant,
					pt_visit_type: $scope.pt_visit_type,
					pt_op_fee: $scope.pt_op_fee,
					room_id: $scope.room_id,
					bed_id: $scope.bed_id,
					pt_admit_type: $scope.pt_admit_type,
					pt_payment_type: $scope.pt_payment_type

				});
				var config = {
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
					}
				}
				$http.post("../php/outpatient.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
					console.log(data.data);
					//$scope.action = 4;
					location.reload();
					//$scope.op_patient = data.data.patnt;
					//$scope.op_hosp = data.data.hsp;
				});

			}

		}

		$medwiseLog.save('Users', 'extra Data');

	}
    
    $scope.add_inv_unit = function () {
		$scope.action = 2;
	}
	
});

