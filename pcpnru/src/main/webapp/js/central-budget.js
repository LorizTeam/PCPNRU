var app = angular.module('central-budget1', [], function($httpProvider) {
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
}); 

app.controller('myCtrl', function($scope, $http,$window) {
	   
	$scope.project_central=""; 
	$scope.frombalance_rock=0;
	$scope.rocking_budget=0;
	$scope.balance=0;
	$scope.remark="";
	
	$scope.projectcentral = function() {  
		$scope.clearinput();
		$http({
	          method: "POST", 
	          url: "ajax_centralbudget.jsp",
	          params:{"projectCode":$scope.project_central.split(' - ')[0],"year":$scope.project_central.split(' - ')[1],"ajax_type":"select"},
	          headers: {"Accept-Charset":"charset=utf-8",'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'}
	          
	        }).then(function(response) {  
	        	$scope.status = response.status;
	            $scope.datas = response.data;   
	        }); 
	}
	
	
	$scope.central_amt = function() {  
		 
		$http({
	          method: "POST", 
	          url: "ajax_centralbudget.jsp",
	          params:{"projectCode":$scope.project_central.split(' - ')[0],"year":$scope.project_central.split(' - ')[1],"gcostcode":$scope.gcostcode,"ajax_type":"amt"},
	          headers: {"Accept-Charset":"charset=utf-8",'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'}
	          
	        }).then(function(response) {
	        	 $scope.frombalance = response.data;
	        }); 
	}
	
	$scope.clearinput = function(){ 
		$scope.frombalance=""; 
		//$("#gcostcode").select2("val", "");
		//$('#gcostcode').html('').select2({data: [{id: '', text: ''}]});
	}
	 
});