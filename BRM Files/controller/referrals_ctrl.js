angular.module('medwise').controller('referrals_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.ref_occupations = ["DOCTOR", "RMP", "PMP", "OTHERS"];
    $scope.org_types = ["HOSPITAL", "CLINIC", "SCANNING","LAB"];
    $scope.menu_uid =[];
	$scope.p_yes = 0;
	$scope.photoPath = null;
	$scope.size = 0;


    $scope.init=function()
        {
            $scope.action=1;
            $http.get("../php/referrals.php?act=all").then(function OnSuccess(res){			 
                $scope.referals=res.data;

                if(Array.isArray($scope.referals)) {
                    $scope.noRecords = false;
                } else {
                    $scope.noRecords = true;
                    $scope.referals = [];
                }
            });
            $medwiseLog.save('Users','extra Data');
        }

    $scope.Home = function(){
        for(var i in $scope.menu_uid){
            $scope.menu_uid[i] = 0;
        }
        $scope.action = 1;
    }
    
	$scope.add_refer=function(){
			$scope.action=2;			
    }
    
	$scope.cpy=function(strcp)
	{
		$scope.ref_whatsapp=strcp;
    }
    
	$scope.delcpy=function()
	{
		$scope.ref_whatsapp='';
	}
	
	
	$scope.save_referal=function(){
		//console.log($scope.myFile);
		/*  if(Number($scope.myFile.size) > 1048576) {
			$scope.sze = "Photo Size Exeed";
			return;
			} 
			if($scope.myFile.type != "image/jpeg" &&  $scope.myFile.type != "bmp") {
			$scope.sze = "jpeg,bmp formats only";
			return;
			}
			
		$scope.sze = ''; */
	
 	var formData = new FormData();
    formData.append('refPhoto', $scope.myFile);
	formData.append('ref_name', $scope.ref_name);
	formData.append('ref_occupation', $scope.ref_occupation);
	formData.append('ref_org_type', $scope.ref_org_type);
	formData.append('ref_org_name', $scope.ref_org_name);
	formData.append('ref_address', $scope.ref_address);
	formData.append('ref_city', $scope.ref_city);
	formData.append('ref_mobile', $scope.ref_mobile);
	formData.append('ref_whatsapp', $scope.ref_whatsapp);
	formData.append('ref_email', $scope.ref_email);
	formData.append('ref_srb', $scope.ref_srb);
	formData.append('ref_acc_hol_name', $scope.acc_hol_name);
	formData.append('ref_account_no', $scope.account_no);
	formData.append('ref_bank_name', $scope.bank_name);
	formData.append('ref_branch', $scope.branch);
	formData.append('ref_ifsc_code', $scope.ifsc_code);
				
	
        
            var config = {
				transformRequest: angular.identity,
                headers : {
                    'Content-Type': undefined,
					'Process-Data': false
                }
			}
		$http.post("../php/referrals.php?act=add", formData, config).then(function OnSuccess(res,status,header,config){
			$scope.result = res.data;
			$route.reload();
			//console.log(res.data);	
			//$scope.action=1;
			//$scope.init();
		});
			$scope.ref_name='';
			$scope.ref_occupation='';
			$scope.ref_org_type='';
			$scope.ref_org_name='';
			$scope.ref_address='';
			$scope.ref_city='';
			$scope.ref_mobile='';
			$scope.ref_whatsapp='';
			$scope.ref_email='';
			$scope.ref_srb='';    
			$scope.acc_hol_name = '';    
			$scope.account_no = '';    
			$scope.bank_name = '';    
			$scope.branch = '';    
			$scope.ifsc_code = '';    
	} 
	
		$scope.change_status=function(refid,status,index){		 
		if(status==1)
			status=0;
		else
			status=1;
		$scope.referals[index].ref_is_deleted=status;
		$http.get("../php/referrals.php?act=st&ref_is_deleted="+status+"&ref_id=" + refid).then(function OnSuccess(res){
			//console.log(res.data);
		 });
		
	}
	$scope.displayPhoto = function(pPath){
		if(pPath === null) {
			$scope.photoPath = pPath;
		} else {
			$scope.photoPath = '../uploads/referrals/' + pPath;
		}
	}
	
	$scope.get_item_menu=function(ind,itm_id){
  		$scope.result="";
		if($scope.menu_uid[ind] != itm_id)
			$scope.menu_uid[ind] = itm_id;
		 else
			$scope.menu_uid[ind] = 0;	 
		
	$scope.update_referral=function(ref_id,y){				
		var data = $.param({				
				ref_name: y.ref_name,
				ref_occupation: y.ref_occupation,
				ref_org_type: y.ref_org_type,
				ref_org_name: y.ref_org_name,
				ref_address: y.ref_address,
				ref_city: y.ref_city,
                ref_mobile: y.ref_mobile,
				ref_whatsapp: y.ref_whatsapp,
				ref_email: y.ref_email,
				ref_srb: y.ref_srb,
				ref_id:ref_id,
				ref_acc_hol_name:y.ref_acc_hol_name,
				ref_account_no:y.ref_account_no,
				ref_bank_name:y.ref_bank_name,
				ref_branch:y.ref_branch,
				ref_ifsc_code:y.ref_ifsc_code
				});
        
            var config = {
                headers : {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
			}
		$http.post("../php/referrals.php?act=up",data,config).then(function OnSuccess(data,status,header,config){
			$scope.result=data.data;
			 //console.log(data.data);
		});
		
		location.reload();
		
	}
		
	}
	$scope.show_bank_details = function(bid){
		$http.get("../php/referrals.php?action=model&ref_id=" + bid).then(function OnSuccess(res){
			$scope.bank_details_data = res.data;
	});
	}
	
});

