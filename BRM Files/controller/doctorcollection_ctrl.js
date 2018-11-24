angular.module('medwise').controller('doctorcollection_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level = parseInt($scope.login_data.edwise.level);
    $scope.dr_collection = {};

	$scope.ref_col = {};
	$scope.dr_col = {};
	$scope.dr_col.visits = [];
	$scope.ref_col.visits = [];


	$scope.init = function() {
		//alert($scope.login_data.uid);
		$scope.yes_table = 2;
		$scope.no_data = 2;
		$scope.dr_no_data = 2;
				$scope.from_date = new Date();
				$scope.dr_collection.from_date = $scope.from_date.toLocaleDateString('en-GB',{ day:'2-digit', month:'long', year:'numeric' });

				$scope.to_date = new Date();
				$scope.dr_collection.to_date = $scope.to_date.toLocaleDateString('en-GB',{ day:'2-digit', month:'long', year:'numeric' });

				// $scope.temp = new Date();
        // $scope.from_date = $scope.temp.toLocaleDateString('en-GB',{ day:'numeric', month:'numeric', year:'numeric' });
        // var splitDate = $scope.from_date.split("/");
        // $scope.dr_collection.from_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];

				// $scope.temp = new Date();
        // $scope.to_date = $scope.temp.toLocaleDateString('en-GB',{ day:'numeric', month:'numeric', year:'numeric' });
        // var splitDate = $scope.to_date.split("/");
        // $scope.dr_collection.to_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];

				$scope.temp = new Date();
        $scope.payment_date = $scope.temp.toLocaleDateString('en-GB',{ day:'numeric', month:'numeric', year:'numeric' });
        var splitDate = $scope.payment_date.split("/");
        $scope.dr_collection.payment_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];

				$scope.temp = new Date();
        $scope.dr_payment_date = $scope.temp.toLocaleDateString('en-GB',{ day:'numeric', month:'numeric', year:'numeric' });
        var splitDate = $scope.dr_payment_date.split("/");
        $scope.dr_collection.dr_payment_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];

		$(document).ready(function() {
        // $("#from_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
        // $("#to_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
        $("#payment_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
        $("#dpayment_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
		});
		//Get All Dotors
         $http.get("../php/login.php?action=get_doctors").then(function OnSuccess(res){
            $scope.doctorsData = res.data;
			//console.log($scope.doctorsData);

        });

       /*  //Get All PRO's
        $http.get("../php/login.php?action=get_pros").then(function OnSuccess(res){
            $scope.proList = res.data;

        }); */

        //Get All Referrals
        $http.get("../php/referrals.php?action=ref_status").then(function OnSuccess(res){
            $scope.referralList = res.data;
        });
		$medwiseLog.save('Users','extra Data');
     }

	 $scope.change_from_date = function(date) {  
       var splitDate = date.split("/");
       $scope.dr_collection.from_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
      }

	  $scope.change_to_date = function(date) {
        var splitDate = date.split("/");
        $scope.dr_collection.to_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
      }

	   $scope.change_payment_date = function(date) {
        var splitDate = date.split("/");
        $scope.dr_collection.payment_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
	   }

	   $scope.dr_change_payment_date = function(date) {
        var splitDate = date.split("/");
        $scope.dr_collection.dr_payment_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
	   }

     $scope.get_dr_ref_col = function(d_r_id,fm_date,to_date,dr_or_ref){
			 	//alert(fm_date+" "+to_date);
				//alert($scope.dr_collection.from_date+" "+$scope.dr_collection.to_date);
				 if(dr_or_ref == 'r'){
							$scope.yes_table = 1;
							$scope.dr_yes_table = 0;
							$http.get("../php/doctor_collection.php?action=getReferralDetails&fromDate=" + $scope.dr_collection.from_date + "&toDate=" + $scope.dr_collection.to_date + "&referralId=" + d_r_id).then(function OnSuccess(res){
									$scope.get_doc_ref_data = res.data;
									console.log($scope.get_doc_ref_data);
									if(Array.isArray($scope.get_doc_ref_data)){
										$scope.no_data = 0;
										$scope.dr_no_data = 2;
									} else {
										$scope.get_doc_ref_data = [];
										$scope.no_data = 1;
										$scope.dr_no_data = 2;
									}
							});
				 }
		 	 	// Doctor Collection
				if(dr_or_ref == 'd'){
						$scope.dr_yes_table = 1;
						$scope.yes_table = 0;
						$http.get("../php/doctor_collection.php?action=getDoctorDetails&fromDate=" + $scope.dr_collection.from_date + "&toDate=" + $scope.dr_collection.to_date + "&doctorId=" + d_r_id).then(function OnSuccess(res){
								$scope.get_doc_coll_data = res.data;
								console.log($scope.get_doc_coll_data);
								if(Array.isArray($scope.get_doc_coll_data)){
									$scope.dr_no_data = 0;
									$scope.no_data = 2;
								} else{
									$scope.get_doc_coll_data = [];
									$scope.dr_no_data = 1;
									$scope.no_data = 2;
								}
						});
				}
	 }

	 $scope.all_reset = function(){
		 $scope.yes_table = 0;
		 $scope.dr_rf_name = '';
		 $scope.paid_status = '';
		 $scope.init();
	 }

	 $scope.save_ref_data = function(dr_or_ref){
			//alert(dr_or_ref);

		 $scope.ref_col.userId = $scope.login_data.edwise.uid;
		 $scope.ref_col.paymentThrough = $scope.paid_through;
		 $scope.ref_col.paymentDate = $scope.dr_collection.payment_date;
		 $scope.ref_col.paymentType = $scope.payment_type;
		 $scope.ref_col.paymentDetails = $scope.payment_details;
		 $scope.ref_col.visits = $scope.get_doc_ref_data;



		  var data = $.param({
                        referralPayment:$scope.ref_col
                        });

            var config = { headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'} }
        $http.post("../php/referralPayment.php?action=add",data,config).then(function OnSuccess(data,headers,config,status){
            console.log(data.data);
			//console.log(data);
        });
        $route.reload();
       //$scope.all_reset();
        //$medwiseLog.save('Update_Consult'+ data);

	 }
	 //Doctor Save
	 $scope.save_dr_data = function(){
			//alert(dr_or_ref);

		 $scope.dr_col.userId = $scope.login_data.edwise.uid;
		 $scope.dr_col.paymentThrough = $scope.dr_paid_through;
		 $scope.dr_col.paymentDate = $scope.dr_collection.dr_payment_date;
		 $scope.dr_col.paymentType = $scope.dr_payment_type;
		 $scope.dr_col.paymentDetails = $scope.dr_payment_details;
		 $scope.dr_col.visits = $scope.get_doc_coll_data;

		  var data = $.param({
                        doctorPayment:$scope.dr_col
                        });

            var config = { headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'} }
       $http.post("../php/doctorPayment.php?action=add",data,config).then(function OnSuccess(data,headers,config,status){
            console.log(data.data);
			//console.log(data);
        });
        $route.reload();
       //$scope.all_reset();
        //$medwiseLog.save('Update_Consult'+ data);

	 }

    });
