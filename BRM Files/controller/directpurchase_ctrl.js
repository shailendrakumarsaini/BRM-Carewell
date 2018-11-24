    angular.module('medwise').controller('directpurchase_ctrl', function ($scope,$http,$filter,$window,$route,$medwiseLog) {
        $scope.login_data = JSON.parse($window.sessionStorage.getItem('_login'));
        $scope.level = parseInt($scope.login_data.edwise.level);
        $scope.pos = {};
        $scope.pos.items_list = [];
        $scope.item_obj = {};
        $scope.pos.net_amount = 0; 
        $scope.pos.total_amount = 0;
        $scope.pos.user_id = $scope.login_data.edwise['uid'];
        $scope.show_Net_Price = 0;
        $scope.pos.discount = 0;
        $scope.item_obj.free = 0;   
        $scope.pre_i_d = 0;  
        $scope.enable = 0;
        $scope.addBtnDisable = 'no';



        $scope.autosearch_data = function (temp) {
			if(temp != ''){
            $http.get("../php/direct_purchase_order.php?action=medicine_search&search_string=" + temp).then(function OnSuccess(res) {
                $scope.medunits_data = res.data;
                //console.log($scope.medunits_data);
                if (!Array.isArray($scope.medunits_data)) {
                    $scope.medunits_data = [];
                } 
            });
			} else {
				$scope.medunits_data = [];
			}
        }

        $scope.autosearch_data_for_os = function (temp) { 
			if(temp != ''){
            $http.get("../php/direct_purchase_order.php?action=medicine_search&search_string=" + temp).then(function OnSuccess(res) {
                $scope.medunits_data = res.data;
                //console.log($scope.medunits_data);
                if (!Array.isArray($scope.medunits_data)) {
                    $scope.medunits_data = [];
                } 
            });
			} else {
				$scope.medunits_data = [];
			} 
        }


        $scope.add_new_po = function () 
            {
                // $scope.medpo_datee = new Date();
                // $scope.pos.medicinepo_date = $scope.medpo_datee.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
                $http.get("../php/medicines_pos.php?action=supplier").then(function OnSuccess(res) {
                    $scope.suppliers = res.data;
                });

                // $http.get("../php/medicines.php?action=all").then(function OnSuccess(res) {
                //     $scope.medunits_data = res.data;
                //     console.log($scope.medunits_data);
                // });

                $scope.invoicedate = new Date();
                $scope.pos.invoice_date = $scope.invoicedate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
                $scope.temp = new Date();
              
                $scope.expdate = new Date();             
                $scope.item_obj.exp_date = $scope.expdate.toLocaleDateString('en-US', { day: "2-digit", month: "long", year: "numeric" });
                $scope.action = 2;
                $medwiseLog.save('Clicked on Add New MedicinetPO', "");
            }
          
        $scope.add_new_os = function(){
            $scope.os_item_obj = {};
            $scope.os = {};
            $scope.os.os_items_list = [];
            $scope.os_item_obj.free = 0;
            $scope.expdate_for_os = new Date();
            $scope.os_item_obj.exp_date = $scope.expdate_for_os.toLocaleDateString('en-US', { day: '2-digit', month: 'long', year: 'numeric' });
           
            $http.get("../php/medicines_pos.php?action=supplier").then(function OnSuccess(res) {
                $scope.suppliers = res.data;
            });
            // $http.get("../php/medicines.php?action=all").then(function OnSuccess(res) {
            //     $scope.medunits_data = res.data;
            //     console.log($scope.medunits_data);
            // });
            $scope.action = 3;
        }


        $scope.save_OS_data = function () {
            //console.log($scope.os);
            $scope.os.user_id = $scope.login_data.edwise.uid;
            var data = $.param({ directPoOs : $scope.os });
            var log_data = data;
            var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } };
            //console.log($scope.os);
            $http.post("../php/direct_purchase_order.php?action=add_direct_purchase_os", data, config).then(function OnSuccess(res, status, header, config) {
                //console.log(res.data);
                $scope.action = 1;
                $route.reload();
            });
            $medwiseLog.save('Medicine PO', log_data);
        }

        $scope.redirectHome = function(){
            $location.path('dashboard');
        }

        $scope.init = function () 
        {
            $scope.action = 1;
            $http.get("../php/direct_purchase_order.php?action=get_all_direct_po_data").then(function OnSuccess(res) {
                $scope.med_pos = res.data;
                if(Array.isArray($scope.med_pos)){
                    $scope.NoData = 0;
                    for (i in $scope.med_pos){
                            $scope.med_pos[i].medicinepo_id = Number($scope.med_pos[i].medicinepo_id);
                        }
                }else{
                    $scope.med_pos = [];
                    $scope.NoData = 1;
                }
            });
            //$scope.add_new_po();
            $medwiseLog.save('Medicine PO', "Medicine PO opened");
        }
        
        $scope.SortTheData = function (temp)
            {
                $scope.reverseSort = ($scope.sort == temp) ? !$scope.reverseSort : false;
                $scope.sort = temp;
            }



        $scope.show_items = function (idx) {
            //alert(idx);
            $http.get("../php/direct_purchase_order.php?action=get_all_direct_po_details_data&directPOId=" + idx).then(function OnSuccess(res) {
                $scope.med_pos_data = res.data;
                //console.log($scope.med_pos_data);
                //$scope.net_amount=medicinepo_net_price;
            });
            $medwiseLog.save('Retrieved the Items of PO', idx);
        }


        $scope.select_medicine = function(obj){
            //console.log(obj);
            $scope.os_item_obj.med_id = obj.med_id;
            $scope.os_item_obj.mpo_item_name = obj.med_name;
            $scope.os_item_obj.tax_id = obj.med_tax;
            $scope.os_item_obj.tax_percent = obj.tax_percent;
            $scope.os_item_obj.box_pack = obj.med_boxpack;
            $scope.units_for_os = obj.med_sale_units;
            $scope.change_qty_for_os();
        }

        $scope.add_item_for_OB = function () 
        {
            if($scope.os_item_obj.mpo_qty != undefined){ 
                $scope.os_show_Net_Price = 1; 
            } else {
                 $scope.os_show_Net_Price = 0; 
                }

            if($scope.os_item_obj.obj1.med_id == undefined){
                swal('Select Medicine');
                return;
            }
            delete $scope.os_item_obj.obj1;
            $scope.os.os_items_list.push($scope.os_item_obj);
            $scope.os_item_obj = {};
            $scope.os_item_obj.obj1 = {};
            
            $scope.expdate_for_os = new Date();
            $scope.os_item_obj.exp_date = $scope.expdate_for_os.toLocaleDateString('en-US', { day: '2-digit', month: 'long', year: 'numeric' });
            
            $scope.enable = 1;
            $scope.os_item_obj.free = 0;
            //$scope.expdate = new Date();
            // $scope.os_item_obj.exp_date = $scope.expdate_for_os.toLocaleDateString('en-US', { day: '2-digit', month: 'long', year: 'numeric' });
            $scope.os.net_amount = 0;
            $scope.os.total_amount = 0;    
            for ( s in $scope.os.os_items_list) 
                {
                    $scope.os.net_amount = $scope.os.net_amount + Number($scope.os.os_items_list[s].amount_tax);
                }
            $medwiseLog.save('Items added To Object', ""); 
        }


        $scope.add_item = function () 
        {
            $scope.pos.discount = 0;
            $scope.pos.items_list.push($scope.item_obj);
            if($scope.item_obj.mpo_qty != undefined)
                { $scope.show_Net_Price = 1; }
            else
                { $scope.show_Net_Price = 0; }
                
            $scope.item_obj = {};   
            $scope.item_obj.obj = {};

            $scope.expdate = new Date();
            $scope.item_obj.exp_date = $scope.expdate.toLocaleDateString('en-US', { day: '2-digit', month: 'long', year: 'numeric' });
            $scope.pos.net_amount = 0;
            $scope.pos.total_amount = 0;
            
            
            
        for (var i = 0; i < $scope.pos.items_list.length; i++) 
                {
            $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
            $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;
                }
                
                
            $medwiseLog.save('Items added To Object', "");
        
        }

        $scope.get_tax = function (x) 
            {
            //alert(x);
            //var tax = $filter('filter')($scope.medunits_data, { med_id: x }); 
            //return tax[0].tax_percent;
            return "18";
            //$medwiseLog.save('Retrieved the Tax of item', x);
            }


        $scope.save_medicine_po_data = function () {
            //alert("ok");
            // var d = new Date($scope.pos.assetpo_date);
            // var dob = d.getFullYear() + '/' + (parseInt(d.getMonth()) + 1) + '/' + d.getDate();


            var data = $.param({
                directPo: $scope.pos
            });
            
            var log_data = data;
            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("../php/direct_purchase_order.php?action=add_direct_po", data, config).then(function OnSuccess(res, status, header, config) {
                //console.log(data.data);
                $scope.action = 1;
                $route.reload();
                // $scope.init();
                //location.reload();
            // console.log(res.data);
            });
            $medwiseLog.save('Medicine PO', log_data);
        }

        

        $scope.previous_item_data =function(item_id, mobj)    
        {
            //alert('previous_item_data');
            $scope.item_obj.mpo_item_name = mobj.med_name;
            $scope.item_obj.mpo_item_id = item_id;
            $scope.item_obj.tax = mobj.tax_percent;
            $scope.item_obj.tax_id = mobj.med_tax;
            $scope.item_obj.box_pack = mobj.med_boxpack;
            $scope.units = mobj.med_sale_units;
            
            
            
            $http.get("../php/direct_purchase_order.php?action=getMedicinePreviousDetails&med_id=" + item_id).then(function OnSuccess(res){
                $scope.previous_data = res.data;
                //console.log($scope.previous_data);
                    $scope.pre_i_d = 0;
                if (Array.isArray($scope.previous_data)) 
                {
                    /* $scope.item_obj.mpo_mrp = $scope.previous_data[0].mrp;
                    $scope.item_obj.mpo_pp = $scope.previous_data[0].mpo_pp;
                    $scope.item_obj.mpo_qty = $scope.previous_data[0].quantity;*/
                    
                    $scope.myStyle={color:'green'};
                    $scope.pre_sup_name = $scope.previous_data[0].supplier_name;
                    $scope.pre_pp = Number($scope.previous_data[0].purchasePrice).toFixed(2);
                    $scope.pre_mrp = Number($scope.previous_data[0].mrp).toFixed(2);
                    $scope.pre_free = $scope.previous_data[0].free;
                    $scope.pre_i_d = 1;
                    $scope.item_obj.ac_pp = $scope.previous_data[0].mpo_pp; 
                    $scope.item_obj.batch_no = "";
                    $scope.item_obj.free = 0;
                    $scope.change_qty();
                    $scope.change_pp();
                } else 
                {
                    $scope.pre_sup_name = "";
                    $scope.pre_pp = "";
                    $scope.item_obj.mpo_mrp = "";
                    $scope.item_obj.mpo_pp = "";
                    $scope.item_obj.mpo_qty = "";
                    $scope.item_obj.batch_no = "";
                    $scope.item_obj.free = 0;
                    // $scope.pos.items_list[index].tax = "";
                    // $scope.pos.items_list[index].amount = "";
                    // $scope.pos.items_list[index].amount_tax = "";
                $scope.change_qty();  
                }
            });
            
            // console.log($scope.item_obj.mpo_qty);
            $medwiseLog.save('Retrieved Previous Item Po Data', item_id);
        }

        $scope.change_color = function(){
            
            if($scope.item_obj.mpo_pp > $scope.pre_pp)
            {
                $scope.myStyle={color:'red'};
            }
            else
            {
                $scope.myStyle={color:'green'};
            }
            
            
                
        }
        $scope.change_color1 = function(){
        if($scope.item_obj.mpo_mrp > $scope.pre_mrp)
            {
                $scope.myStyle1={color:'red'};
            }
            else
            {
                $scope.myStyle1={color:'green'};
            }
        }
        
        
        $scope.change_qty = function () 
        {
        // if($scope.move==1){
            // $scope.move=1;
            // }else{
            //     $scope.move=1;   
            // }
        // console.log(idx);
            $scope.pos.discount = 0;
            $scope.item_obj.amount = $scope.item_obj.mpo_pp * $scope.item_obj.mpo_qty;
            $scope.item_obj.amount_tax = $scope.item_obj.amount + ($scope.item_obj.amount * ($scope.item_obj.tax / 100));
            
            $scope.pos.net_amount = 0;
            $scope.pos.total_amount = 0;
        }

        $scope.change_qty_for_os = function () 
        {
            $scope.os_item_obj.amount = $scope.os_item_obj.mpo_pp * $scope.os_item_obj.mpo_qty;
            $scope.os_item_obj.amount_tax = $scope.os_item_obj.amount + ($scope.os_item_obj.amount * ($scope.os_item_obj.tax_percent / 100));
        }

        
        $scope.change_pp = function()
            {
                $scope.pos.discount = 0;
                $scope.item_obj.amount = $scope.item_obj.mpo_pp * $scope.item_obj.mpo_qty;
        $scope.item_obj.amount_tax = Number($scope.item_obj.amount) + 
        Number(($scope.item_obj.amount * $scope.item_obj.tax) / 100);
                //alert($scope.item_obj.amount_tax);
                $scope.pos.net_amount = 0;
                $scope.pos.total_amount = 0;

                /* for (var i = 0; i < $scope.pos.items_list.length; i++) {
                    $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
                    
                    $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;
                    
                } */
                $scope.change_act_price();
            }

            $scope.change_pp_for_os = function()
            {
                if($scope.os_item_obj.mpo_qty == '' || $scope.os_item_obj.mpo_qty == undefined){
                    swal('Select Quantity First');
                    return;
                }
                // if($scope.os_item_obj.free == '' || $scope.os_item_obj.free == undefined){
                //     swal('Select No. Of Free Items First');
                //     return;
                // }
                $scope.os_item_obj.amount = $scope.os_item_obj.mpo_pp * $scope.os_item_obj.mpo_qty;
                $scope.os_item_obj.amount_tax = $scope.os_item_obj.amount + ($scope.os_item_obj.amount * ($scope.os_item_obj.tax_percent / 100));
                $scope.change_act_price_for_os();
            }


        $scope.item_remove = function (idx, amount) 
            {
                $scope.pos.discount = 0;
                $scope.pos.net_amount = $scope.pos.net_amount - amount;
                $scope.pos.items_list.splice(idx, 1);
                $scope.addBtnDisable = 'no';

                $scope.pos.net_amount = 0;
                $scope.pos.total_amount = 0;
                for (var i = 0; i < $scope.pos.items_list.length; i++) {
                    $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[i].amount_tax;
                    $scope.pos.total_amount = $scope.pos.total_amount + $scope.pos.items_list[i].amount;
                }
                $medwiseLog.save('Removed Previous Item Data', idx);
            }


        $scope.item_remove_for_OS = function (idx, amount) 
            {
                $scope.os.os_items_list.splice(idx, 1);
                if($scope.os.os_items_list.length == 0){
                    $scope.os.store_id  = ''; 
                }
                $scope.enable = 0;
                $medwiseLog.save('Removed Previous Item Data', idx);
            }
                

        $scope.changeDate = function()
            {
                $scope.pos.medicinepo_date = $scope.medpo_datee.toLocaleDateString('en-US', { day:'2-digit', month:'long', year:'numeric' });
            }

        $scope.get_discount = function()
        {
            if($scope.pos.discount != '' && $scope.pos.discount != null && $scope.pos.discount != '0'){
                $scope.pos.net_amount = ($scope.pos.net_amount - ($scope.pos.net_amount * $scope.pos.discount) / 100).toFixed(2);
                }
            else {
                $scope.pos.net_amount = 0;
                for (var k = 0; k < $scope.pos.items_list.length; k++) {
                    $scope.pos.net_amount = $scope.pos.net_amount + $scope.pos.items_list[k].amount_tax;
                }
            }
        }
        $scope.os_get_discount = function()
        {
            if($scope.os.discount != '' && $scope.os.discount != null && $scope.os.discount != '0'){
                $scope.os.net_amount = ($scope.os.net_amount - ($scope.os.net_amount * $scope.os.discount) / 100).toFixed(2);
                }
            else {
                $scope.os.net_amount = 0;
                for (var k = 0; k < $scope.os.os_items_list.length; k++) {
                    $scope.os.net_amount = $scope.os.net_amount + $scope.os.os_items_list[k].amount_tax;
                }
            }
        }
        
        $http.get("../php/store.php?action=super_store").then(function OnSuccess(res) {
            $scope.sup = res.data;
                }); 

                $scope.change_act_price = function(){
                    if($scope.item_obj.free != '' && $scope.item_obj.free != null){
                        $scope.item_obj.ac_pp = ($scope.item_obj.amount / (Number($scope.item_obj.mpo_qty) + Number($scope.item_obj.free))).toFixed(2);
                    }
                    else{
                        //alert('hi');
                        $scope.item_obj.ac_pp = Number($scope.item_obj.mpo_pp).toFixed(2);
                    }
                }
                
                $scope.change_act_price_for_os = function(){
                    if($scope.os_item_obj.mpo_qty == '' || $scope.os_item_obj.mpo_qty == undefined){
                        swal('Select Quantity First');
                        return;
                    }
                    if($scope.os_item_obj.free != '' && $scope.os_item_obj.free != null){
                        $scope.os_item_obj.ac_pp = ($scope.os_item_obj.amount / (Number($scope.os_item_obj.mpo_qty) + Number($scope.os_item_obj.free))).toFixed(2);
                    }
                    else{
                        $scope.os_item_obj.ac_pp = Number($scope.os_item_obj.mpo_pp).toFixed(2);
                    }
                }
                $scope.all_reset = function(){
                    
                    $scope.action = 1;
                    $scope.pre_sup_name = "";
                    $scope.pre_pp = "";
                    $scope.item_obj.mpo_mrp = "";
                    $scope.item_obj.mpo_pp = "";
                    $scope.item_obj.mpo_qty = "";
                    $scope.item_obj.batch_no = "";
                    $scope.item_obj.free = 0;
                    
                }


        
    });

