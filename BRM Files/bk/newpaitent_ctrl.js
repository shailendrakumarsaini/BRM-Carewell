angular.module('medwise').controller('newpaitent_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);
    

	 $scope.init=function()
		{
			$scope.action=1;
			$http.get("../php/registration.php?action=all").then(function OnSuccess(res)
				{
				$scope.unit_data=res.data;
				});
			$medwiseLog.save('Users','extra Data');
		}
     $scope.save = function () 
	   {
		alert("Do You Want To Insert Data");
		$scope.status = 0;

		if ($scope.status == 0) 
			{
				var data = $.param(
					{
                        name_ms:$scope.name_ms,
                        name_first:$scope.name_first,
                        name_middle:$scope.name_middle,
                        name_last:$scope.name_last,
                        birth:$scope.birth,
                        next_kn_name: $scope.next_kn_name,
                        photo:$scope.photo,
                        patient:$scope.patient,
                        case_file_no:$scope.case_file_no,
                        issued_to:$scope.issued_to,
                        gender:$scope.gender,
                        mobile_no:$scope.mobile_no,
                        relation:$cope.relation,
                        mobile1_no:$scope.mobile1_no,
                        next_kn_address:$scope.next_kn_address,
                        vip_patient:$scope.vip_patient,
                        old_reg:$scope.old_reg,
                        address:$scope.address,
                        nationality:$scope.nationality,
						occupation:$scope.occupation,
                        email:$scope.email,
                        remarks:$scope.remarks,
                        portal_access:$scop.portal_access,
                        aadhar_id:$scope.aadhar_id,
                        state:$scope.state,
                        country:$scope.country,
                        religion:$scope.religion,
                        customlist:$scope.customlist
					});
				var config = 
					{
					headers:{
							'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
							}
					}
				$http.post("../php/registration.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
					console.log(data.data)
					//$scope.action = 4;
					location.reload();
					//$scope.op_patient = data.data.patnt;
					//$scope.op_hosp = data.data.hsp;
				});
			}
        }
	
});

