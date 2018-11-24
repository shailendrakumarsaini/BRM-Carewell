angular.module('medwise').controller('medicineoutward_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
    $scope.out = {};
    $scope.out.items_list = [];
    $scope.selected_data = {};
	$scope.out.ao_user_id = $scope.login_data.edwise['uid'];
    $scope.out.medicines_list = [];
	
 
     $scope.init=function(){
        $scope.action=1;
        $http.get("../php/medicine_outward_register.php?action=all").then(function OnSuccess(res1){
             $scope.details1_data=res1.data;
             //console.log($scope.details1_data);
             if(Array.isArray($scope.details1_data)){
                 $scope.NoData = 0;
             }else{
                 $scope.details1_data = [];
                 $scope.NoData = 1;
             }
             });
        $http.get("../php/medicine_outward_register.php?action=store").then(function OnSuccess(res){
        $scope.unit_data = res.data;
        //console.log($scope.unit_data);
        //$scope.showMedicine=1;
        });
         $medwiseLog.save('Medicine Outward','Medicine outward opened'); 	
     }
     
     
     $scope.mx=function(x,y)
     {
         if (parseInt(x)>parseInt(y))
         {
             return parseInt(y);
         }
        else {
            return parseInt(x);
            }
        
     }
    
     
     $scope.add_show=function(){
         $scope.action=2;
         $scope.get_data = [];
         $scope.transactiontime = new Date();
         $scope.out.ao_transactiontime = $scope.transactiontime.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
     }
 
     
     $scope.get_item=function(fid){
        // alert(fid);
        // alert($scope.unit_data[fid].id);
        $scope.out.medicines_list = [];
         $http.get("../php/medicine_stock_register.php?action=specific_store_outward&store_id=" +$scope.unit_data[fid].id).then(function OnSuccess(res){
             $scope.get_data = res.data;
             //console.log($scope.get_data);
             if(!Array.isArray($scope.get_data)) {
                $scope.get_data = [];
             }
             $scope.out.ao_fromstore_id=$scope.unit_data[fid].id;
             $scope.out.ao_fromstore_name=$scope.unit_data[fid].store_name;
             $scope.selectedStore = $scope.unit_data[fid].store_name;
             $scope.showMedicine=1;
             $scope.tidx="";
             $scope.query="";
             });
        }

    $scope.item_remove=function(index)
        {
            $scope.out.medicines_list.splice(index,1);
        }

    $scope.search_item=function(tid){
            $scope.out.ao_tostore_id=$scope.unit_data[tid].id;
            $scope.out.ao_tostore_name=$scope.unit_data[tid].store_name;	
            $scope.s=1;
            $scope.query="";
        }

    $scope.show_outward_details=function(idx){
        $http.get("../php/medicine_outward_register.php?action=transcation_id&transcation_id=" +idx).then(function OnSuccess(res){
             $scope.outward_data = res.data;
             });
        }
          
    $scope.toggleGuess=function(){
            if($scope.query=='') 
                $('p').hide();
            else 
                $('p').show();
        }
          
     $scope.get_details=function(xid,zid,ssid){
        //  alert(xid);
        //  alert(zid);
        //  alert(ssid);
         $http.get("../php/medicine_stock_register.php?action=stock_details&store_id=" +xid + "&item_id="+zid).then(function OnSuccess(res){
                $scope.details_data=res.data;
                $scope.itid=zid;
                // console.log($scope.details_data.length);
                // console.log($scope.details_data);
                    $http.get("../php/medicine_outward_register.php?action=all").then(function OnSuccess(res1){
                        $scope.details1_data=res1.data;
                        //console.log($scope.details1_data);
                    }); 
                        $scope.query="";
                            $('p').hide();
                     
                        //for(var i in $scope.details_data){
                            var items = {
                                        item_id:$scope.details_data[0].med_id,
                                        store_name: $scope.details_data[0].store_name,
                                        med_name:$scope.details_data[0].med_name,  
                                        quantity:$scope.details_data[0].quantity,
                                        received_quantity:""
                                    }
                            $scope.out.items_list.push(items);
                        //    }
                });
         $scope.showMedicine=2;
         //default date
     var today = new Date();
     var dd = today.getDate();
     var mm = today.getMonth()+1; //January is 0!
     var yyyy = today.getFullYear();
 
     if(dd<10) {
     dd = '0'+dd
     } 
     if(mm<10) {
     mm = '0'+mm
     } 
    $scope.today = yyyy +'/'+mm+'/'+dd;
    $scope.out.ao_transactiontime=today;
     }
     
    $scope.save_out_data = function () 
        {	
            $scope.out.ao_transactiontime=$filter('date')($scope.out.ao_transactiontime, "yyyy-MM-dd h:m:s a")
            //console.log($scope.out);
                var data = $.param({
                   medicine_outward : $scope.out
                });
                var config = { headers:{ 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
                $http.post("../php/medicine_outward_register.php?action=add", data, config).then(function OnSuccess(res, status, header, config) {
                    //console.log(res.data);
                    $scope.action = 1;                     
                });			
                $medwiseLog.save('Medicine Outward', data);
                $route.reload();
                
        }

    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }
        
    $scope.Home = function(){
            $scope.action = 1;
            $scope.out = {};
        }
	
});

