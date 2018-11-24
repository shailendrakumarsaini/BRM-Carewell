angular.module('medwise').controller('payment_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
	$scope.level=parseInt($scope.login_data.edwise.level);
	$scope.onetime="onetime";
	$scope.paidstatus = "1";
    $scope.temp = new Date();
    $scope.ind_comp = '';

    $scope.invoicedate = new Date();
    $scope.invoice_date = $scope.invoicedate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
	
	$scope.todate = new Date();
    $scope.to_date = $scope.todate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
	
	$scope.fromdate = new Date();
    $scope.from_date = $scope.fromdate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
		
	$scope.paymentdate = new Date();
    $scope.payment_date = $scope.paymentdate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" }); 
	
	$scope.init=function(){
        $scope.action=1;    
        $scope.pay = 1;
        $scope.pay1 = 1;
        $http.get("../php/payments.php?action=expenditure").then(function OnSuccess(res){
                $scope.all_exp_data=res.data;
            });
		 $http.get("../php/payments.php?action=all").then(function OnSuccess(res){
                $scope.payment_data=res.data;
                if(Array.isArray($scope.payment_data))
                {
                    for(var i in $scope.payment_data){
                        $scope.payment_data[i].amount = Number($scope.payment_data[i].amount);
                        $scope.payment_data[i].invoiceNo = Number($scope.payment_data[i].invoiceNo);
                    }
                }else{
                    $scope.pay = 2;
                }
                //console.log($scope.payment_data);
            });
		 $http.get("../php/payments.php?action=no_status").then(function OnSuccess(res){
			$scope.canceled_payment_data=res.data;
			if(!Array.isArray($scope.canceled_payment_data))
			{
				$scope.pay1 = 2;
				
			}
			//console.log($scope.payment_data);
		 });
		$medwiseLog.save('Users','extra Data');
    }

    $(document).ready(function(){
        $("#invoice_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
        $("#fromdateID").datepicker({ dateFormat : 'dd/mm/yy' });
        $("#to_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
        $("#paymentdateID").datepicker({ dateFormat : 'dd/mm/yy' });
    });

    $scope.change_invoice_date = function(invoice_date){
		
		var splitDate = invoice_date.split("/");
		$scope.invoice_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
		
        //$scope.invoice_date = invoice_date;
		
        //alert($scope.invoiceDate);
    }
   
    // $(document).ready(function(){
    //     $("#invoice_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
    // });
    $scope.change_from_date = function(from_date){
		
		var splitDate = from_date.split("/");
		$scope.from_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
		
        //$scope.from_date = from_date;  
        //alert($scope.from_date);
    }
    
    // $(document).ready(function(){
    //     $("#to_dateID").datepicker({ dateFormat : 'dd/mm/yy' });
    // });
    $scope.change_to_date = function(to_date){
		
		var splitDate = to_date.split("/");
		$scope.to_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
		
       // $scope.to_date = to_date;  
        //alert($scope.to_date);
    }
    
    // $(document).ready(function(){
    //     $("#paymentdateID").datepicker({ dateFormat : 'dd/mm/yy' });
    // });
    $scope.changeDate_for_payment_date = function(payment_date){
		
		var splitDate = payment_date.split("/");
		$scope.payment_date = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
		
        //$scope.payment_date = payment_date;  
        //alert($scope.payment_date);
    }  

	$scope.enable_add = function()
	{
		$scope.action = 2;
		$scope.pay1 = 1;
		$scope.pay2 = 1;
	}
	$scope.save_payment = function()
	{
		
		if($scope.ind_comp === 'Others') {
			
			$scope.rec_id = '';
		}
		var data = $.param({
			user_id:$scope.login_data.edwise.uid,
			expCatId:$scope.category,
			individualOrCompany:$scope.ind_comp,
			purpose:$scope.purpose,
			invoiceNo:$scope.invoiceno,
			invoiceDate:$scope.invoice_date,
			onetimeOrDateRange:$scope.onetime,
			fromDate:$scope.from_date,
			toDate:$scope.to_date,
			amount:$scope.amount,
			dateOfPayment:$scope.payment_date,
			receivedUserId:$scope.rec_id,
			receivedBy:$scope.rec_name,
			pay_status:$scope.paidstatus
			
		});
		var log_data = data;
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/payments.php?action=add", data, config).then(function OnSuccess(data, status, header, config) {
            //console.log(data.data);
			//$scope.msg2 = "Password Changed Successfully";
            $route.reload();
            
        }); 
	};
	
	$scope.alertRec = function(received_name2) {
		
		$scope.rec_name = received_name2;
	}
	$scope.get_received = function(rec){
		$http.get("../php/payments.php?action=get_rec_ids&user_type=" + rec).then(function OnSuccess(res){
			$scope.get_received_data = res.data;
			
		});
	}
	$scope.rec_data = function(obj){
		$scope.rec_id = obj.id;
		$scope.rec_name = obj.name;
	}
	$scope.change_status = function (id) {
        $http.get("../php/payments.php?action=status&payment_id=" + id).then(function OnSuccess(res) {
            //console.log(res.data);
			 $route.reload();
        });
       
      
    }
	$scope.change_pay_status = function (pid) {
        $http.get("../php/payments.php?action=paid_status&payment_id=" + pid).then(function OnSuccess(res) {
            //console.log(res.data);
			 $route.reload();
        });
       
      
    }
	$scope.all_reset = function(){
		$scope.category = '';
		$scope.ind_comp = '';
		$scope.purpose = '';
		$scope.invoiceno = '';
		$scope.invoice_date = '';
		$scope.from_date = '';
		$scope.to_date = '';
		$scope.amount = '';
		$scope.payment_date = '';
		$scope.action = 1;
		if(!Array.isArray($scope.payment_data))
			{
				$scope.pay = 2;
			}
			if(!Array.isArray($scope.canceled_payment_data))
			{
				$scope.pay1 = 2;
				
			}
    }
    
    $scope.SortTheData = function (temp) 
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }
	
});

