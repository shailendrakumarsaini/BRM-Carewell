angular.module('medwise').controller('doctorconsultation_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog,$location) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);
    $scope.update = [];

    $scope.Home = function(){
        $scope.update = 0;
       $scope.action = 1;
    }

    $scope.init=function()
    {
        $scope.action=1;
		$http.get("../php/Dr_consultation.php?action=all").then(function(res){
            $scope.consult_data = res.data;
            //console.log($scope.consult_data);
            if(Array.isArray($scope.consult_data)){
                $scope.change = 0;
            } else {
                $scope.consult_data = [];
                $scope.change = 1;
            }
            //console.table($scope.consult_data,['dr_consult_id','dr_id','type_of_consultation','name','con_status','amount']);
		});
		$http.get("../php/fecilities.php?action=getActiveDrConsultationFecilities").then(function(res){
            $scope.get_op_conslt = res.data;
		});
        $http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res){
		 	$scope.doctors_data=res.data;
			//console.log($scope.doctors_data[0].qualification);
        });
		$medwiseLog.save('Doctor_Consult'+'Data is Loaded' );
    }


    $scope.get_patient_menu = function(dr_consult_id)
        {
            if ($scope.update != dr_consult_id)
                $scope.update = dr_consult_id;
            else
                $scope.update = 0;
            $medwiseLog.save('Get Patient Menu',);
        }

	$scope.add_new_consult = function(){
		$http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res){
			$scope.doctors_data=res.data;
         });
        $scope.action = 2;
        $medwiseLog.save('Add New Consult');
    }


    $scope.SortData = function(value)
    {
        $scope.Sort = value;
        $scope.reverseSort = ($scope.Sort == value) ? !$scope.reverseSort:true;
        $medwiseLog.save('Sort The Data');
    }

    $scope.change_status = function (dr_consult_id)
    {
        //alert('Are You Sure' + dr_consult_id);
        $http.get("../php/Dr_consultation.php?action=update_status&dr_consult_id=" + dr_consult_id).then(function OnSuccess(res) {
            //console.log(res.data);
        });
        $route.reload();
        $medwiseLog.save('Consult', 'consult_id = ' + dr_consult_id);
    }

    $scope.update_consult = function(i) {

        var data = $.param({
                            dr_consult_id : i.dr_consult_id,
                            dr_id : i.dr_id,
                            consultation_group: i.consultation_group,
                            fcid : i.fcid,
                            amount : i.amount,          
                            valid_days : i.valid_days,
                            valid_visits : i.valid_visits
                        });
            var config = { headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'} }
        $http.post("../php/Dr_consultation.php?action=update",data,config).then(function OnSuccess(data,headers,config,status){
            //console.log(data.data);
			//console.log(data);
        });
        $route.reload();
        $scope.action = 1;
        $medwiseLog.save('Update_Consult'+ data);
    }

	$scope.Save_consult_data = function()
	{

        var data = $.param({
            dr_id : $scope.dr_id,
            fcid : $scope.consultation_type,
            amount : $scope.amount,
            valid_days: $scope.valid_days,
            valid_visits: $scope.valid_visits
        });

		var config = { headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'} }
		$http.post("../php/Dr_consultation.php?action=add",data,config).then(function(data,header,config,status){
			//console.log(data.data);
			$route.reload();
			$scope.action = 1;
		});
		$medwiseLog.save('Consult Data Added', data);
    }


    $scope.assignConsultType = function(value) {
        $scope.type_of_consultation = value;
    }
	$scope.get_op_ip_details = function()
	{
		var data = $.param({
			dr_id: $scope.dr_id,
			consultation_group: $scope.consultation_group,
            type_of_consultation : $scope.type_of_consultation
		});

		var config = { headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'} };

		$http.post("../php/Dr_consultation.php?action=is_consultation_of_dr_exist",data,config).then(function(res,header,config,status){
			//console.log(data.data);
			$scope.opIpDetails = res.data;
			//console.log($scope.opIpDetails);
			$scope.amount = $scope.opIpDetails[0].amount;
			$scope.valid_days = $scope.opIpDetails[0].valid_days;
			$scope.valid_visits = $scope.opIpDetails[0].valid_visits;
			//$route.reload();
		});
	}

});
