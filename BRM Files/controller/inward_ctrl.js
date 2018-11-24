angular.module('medwise').controller('inward_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog,$routeParams,$location) {
	$scope.login_data=JSON.parse($window.sessionStorage.getItem('_login'));
    $scope.level=parseInt($scope.login_data.edwise.level);
	$scope.asset_inward={};
	$scope.asset_inward.items_list=[];
	$scope.asset_inward.asset_inward_supplier_id='';
	$scope.asset_inward.asset_inward_po_id='';
	$scope.asset_inward.asset_inward_user_id='1';
	$scope.asset_inward.asset_inward_invoiceamt = 0;
    $scope.flag_for_disable = [];
    $scope.asset_ob = {};
    $scope.asset_ob.ob_items_list = [];
    $scope.asset_ob.asset_ob_user_id = $scope.login_data.edwise['uid'];

    $scope.choose_medicine = function(obj, idx){
        $scope.asset_ob.ob_items_list[idx].ob_item_id = obj.asset_id;
        //alert(obj.med_id);
    }
 

    $scope.add_new_ob = function(){
        $http.get("../php/store.php?action=super_store").then(function OnSuccess(res) {
            $scope.store = res.data;
            });
            $http.get("../php/assets.php?action=assets_list").then(function OnSuccess(res) {
                $scope.item_data = res.data;
                });
        $scope.action=4;
        $scope.os_received_date = new Date();
        $scope.asset_ob.asset_ob_received_date = $scope.os_received_date.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });

		if($scope.asset_ob.ob_items_list.length == 0){
            //alert($scope.asset_ob.ob_items_list.length);
            var items = {};
            $scope.asset_ob.ob_items_list.push(items);
        }

    }


    $scope.add_item = function()
        {
            var items ={};
            $scope.asset_ob.ob_items_list.push(items);
        }

    $scope.saveOB = function(){
        var data=$.param({ asset_ob :$scope.asset_ob });
        var log_data = data;
        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("../php/asset_inward_register.php?action=add_ob", data, config).then(function OnSuccess(data, status, header, config) {
            //console.log(data.data);
            $scope.action = 1;
            $route.reload();
            // $scope.init();
            //location.reload();
            //console.log(data);
        });
    }

    $scope.item_remove = function (idx) {

        $scope.asset_ob.ob_items_list.splice(idx, 1);

        //$medwiseLog.save('Removed Previous Item Data', idx);
    }

    $scope.SortTheData = function (temp)
        {
            $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
            $scope.sort = temp;
        }

	$scope.callme=function(ind, rec_value){
		//$scope.asset_inward.items_list[ind]['item_rec_qty'] = $scope.apo_qty_received;

		if (typeof rec_value === 'undefined' || rec_value === '') {

			return '';
        }
        //alert(ind + " " + rec_value);
        //alert(rec_value <= $scope.asset_inward.items_list[ind].previous_pend_qty);
        if (rec_value <= $scope.asset_inward.items_list[ind].previous_pend_qty) {
            $scope.asset_inward.items_list[ind].present_rec_qty = rec_value;
            $scope.asset_inward.items_list[ind].item_rec_qty = Number($scope.asset_inward.items_list[ind].previous_rec_qty) + Number($scope.asset_inward.items_list[ind].present_rec_qty);
            $scope.asset_inward.items_list[ind].item_pend_qty = Number($scope.asset_inward.items_list[ind].previous_pend_qty) - Number($scope.asset_inward.items_list[ind].present_rec_qty);
            $scope.asset_inward.items_list[ind].item_amount = Number($scope.asset_inward.items_list[ind].present_rec_qty) * Number($scope.asset_inward.items_list[ind].apo_pp);
            $scope.asset_inward.items_list[ind].item_net_amount = (Number($scope.asset_inward.items_list[ind].item_amount) * (Number($scope.asset_inward.items_list[ind].tax) / 100)) + Number($scope.asset_inward.items_list[ind].item_amount);


            var total_amount = 0;
            for (ci in $scope.asset_inward.items_list) {

                total_amount += Number($scope.asset_inward.items_list[ci].item_net_amount);
            }
            $scope.asset_inward.asset_inward_invoiceamt = total_amount;
            return rec_value;
        } else {

           // alert("Cant be greater than pending quantity");
            return $scope.asset_inward.items_list[ind].previous_pend_qty;
        }
        $medwiseLog.save('To Enter the Persent Receiving quantity', "");
	 }


	$scope.init=function(){
	$scope.action=1;
	$http.get("../php/asset_inward_register.php?action=all").then(function OnSuccess(res){
            $scope.inward_data=res.data;
            if(Array.isArray($scope.inward_data)){
                $scope.NoData = 0;
            }else{
                $scope.inward_data = [];
                $scope.NoData = 1;
            }
			//console.log($scope.inward_data);
		 });
         $medwiseLog.save('Asset Inward', "Asset Inward is opened");
    }

    $scope.OBform = function()
    {
        var data =$.params({
            // :$scope.store_id,
            // :$scope.item_id,
            // :$scope.qty,
            // :$scope.qty_bal

        });
        var config = {
            headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}
        }
        $http.post('URL', data, config).then(function OnSuccess(data,status,header,config){
        //console.log(data);
        $scope.action=1;
		$route.reload();
        });
    }


    $scope.add_inv_unit=function()
    {

        $http.get("../php/store.php?action=super_store").then(function OnSuccess(res) {
        $scope.sup = res.data;
            });
			$scope.invoice_date = new Date();
       $scope.received_date = new Date();
        $scope.asset_inward.asset_inward_invoicedate = $scope.invoice_date.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
        $scope.asset_inward.asset_inward_receiveddate = $scope.received_date.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });

		$scope.action=2;
		//$medwiseLog.save('To Add New Inward', "")
    }

    $scope.show_items = function (idx)
    {
		$scope.asset_inward.items_list=[];
        $http.get("../php/assets_pos.php?action=get_pod_if_not_rec&asset_po_id="+idx).then(function OnSuccess(res) {
			$scope.inward_item_data = res.data;
            //console.log(res.data);
            if(!Array.isArray($scope.inward_item_data)){
                $scope.no_rec=1;
                $scope.test=0;
            }
            else
            {
                $scope.no_rec=0;
                $scope.test=1;
			    var total_invoice_amount = 0;
                for (z in $scope.inward_item_data)
                {
                    //alert(z);
                    //console.log(z);
                    if(z==0)
                    {
                        $scope.asset_inward.asset_inward_supplier_id=$scope.inward_item_data[z].assetpo_supplier_id;
                        $scope.asset_inward.asset_inward_po_id=$scope.inward_item_data[z].asset_po_id;
                        //total_invoice_amount = Number($scope.inward_item_data[z].assetpo_net_price);
                    }
                    var items = {
                        apo_id:$scope.inward_item_data[z].apo_id,
                        item_id:$scope.inward_item_data[z].apo_item_id,
                        apo_item_name:$scope.inward_item_data[z].apo_item_name,
                        item_qty:$scope.inward_item_data[z].apo_qty,
                        item_rec_qty:$scope.inward_item_data[z].apo_qty_received,
                        item_pend_qty:$scope.inward_item_data[z].apo_qty - $scope.inward_item_data[z].apo_qty_received,
                        item_amount:0,
                        item_net_amount:0,
                        apo_pp:$scope.inward_item_data[z].apo_pp,
                        tax:$scope.inward_item_data[z].tax,
                        previous_rec_qty:$scope.inward_item_data[z].apo_qty_received,
                        previous_pend_qty:$scope.inward_item_data[z].apo_qty - $scope.inward_item_data[z].apo_qty_received,
                        present_rec_qty:0
                                }
                    $scope.asset_inward.items_list.push(items);

                    // if (($scope.inward_item_data[z].apo_qty - $scope.inward_item_data[z].apo_qty_received) <= 0)
                    // {
                    //     $scope.flag_for_disable.push(0);
                    // }
                    // else
                    // {
                    //     $scope.flag_for_disable.push(1);
                    // }

			    }
                $scope.asset_inward.asset_inward_invoiceamt = total_invoice_amount;

            }
        });
        //$medwiseLog.save('To Show the Items', idx);
    }

	// $scope.date_rdv = $filter('date')(Date.now(), 'yyyy-MM-dd');


	$scope.save_itm_invward=function(){
		//alert("ok");
		var data = $.param({ asset_inward:$scope.asset_inward });
            var log_data = data;
            var config = {
                headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}
			}
		$http.post("../php/asset_inward_register.php?action=add", data, config).then(function OnSuccess(data,status,header,config){
			// $scope.result=data.data;
            //console.log(data.data);
            $scope.action=1;
			$route.reload();
			//console.log(data);
        });
        $medwiseLog.save('Asset Inward', log_data);
    }

     $scope.qr=function(qty){
		// var range=[];
		 for(i=1;i<=qty;i++)
		 {
			 var obj={
				item_id:'',
				item_name:''
			 }
			 $scope.range.push(obj);
		 }
     }

	 $scope.print_qr=function(idx){
		 $scope.action = 3;
		   $http.get("../php/asset_inward_register.php?action=specific_inward&asset_po_id="+idx).then(function OnSuccess(res) {
			$scope.labels=[];
			for(j=0;j<res.data.length;j++)

			for(i=0;i<res.data[j].item_rec_qty;i++){
				var obj=
                    {
                    srt_id: Number(res.data[j].start_sequence) + i,
                    item_id:res.data[j].asset_id,
                    name:res.data[j].asset_name,
                    g_id:res.data[j].asset_group_id
                    }
				$scope.labels.push(obj);
			}

		   });

	 }
	 $scope.print=function(opp)
	 {
        var mywindow = window.open('', 'PRINT', 'height=full,width=1200');
        mywindow.document.write('<html><head><title>' + document.title + '</title>');
        //mywindow.document.write('</head><body >');
        //mywindow.document.write('<h1>' + document.title  + '</h1>');
        mywindow.document.write(document.getElementById(opp).innerHTML);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/

        mywindow.print();
        mywindow.close();
        return true;
	 }

    $scope.show_inward = function (idx) {
		//alert(idx);
        $http.get("../php/asset_inward_register.php?action=specific_inward&asset_po_id="+idx).then(function OnSuccess(res) {
            $scope.asset_inward_data = res.data;

            $scope.asset_inward_show = [];
            for (z in $scope.asset_inward_data) {
				//alert(z);
				if(z==0)
				{  
                    var inward_show = {
					    inward_show_store_name: $scope.asset_inward_data[z].store_name,
					    inward_show_po_id: $scope.asset_inward_data[z].assetpo_id
                    }
                }
            }

            $scope.asset_inward_show.push(inward_show);
            //$scope.net_amount=assetpo_net_price;

	});
        //$medwiseLog.save('To Show the Inward Data',idx);
    }




});
