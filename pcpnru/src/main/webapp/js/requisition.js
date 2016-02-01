
var app = angular.module('requisition', []);
app.controller('myCtrl', function($scope, $http) {
	$scope.unit=0;
	$scope.priceperunit=0;
	$scope.frombalance=0;
	$scope.tobalance=0;
	$scope.day="";
	$scope.amount = 0;
	$scope.docno = "";
	$scope.projectchange = function() {
		
			
			$scope.gcostcode = '';
			
			$http({
		          method: "POST", 
		          url: "ajax_requisition.jsp",
		          params:{"projectCode":$scope.project.split(' - ')[0],"year":$scope.project.split(' - ')[1],"ajax_type":"select"},
		          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		          
		        }).then(function(response) {
		        	$scope.status = response.status;
		            $scope.datas = response.data;
		            
		        });
		}
		
	$scope.gcostcodechange = function() {
		
		
	
		$http({
	          method: "POST", 
	          url: "ajax_frombudget.jsp",
	          params:{"projectCode":$scope.project.split(' - ')[0],"year":$scope.project.split(' - ')[1],"gcostcode":$scope.gcostcode},
	          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	          
	        }).then(function(response) {
	            $scope.frombalance = response.data;
	            
	        });
	}
	
	$scope.addrequisition = function() {
		
		
		$http({
	          method: "POST", 
	          url: "ajax_requisition.jsp",
	          params:{"projectCode":$scope.project.split(' - ')[0],
					"year":$scope.project.split(' - ')[1],
					"gcostcode":$scope.gcostcode,
					"unit":$scope.unit,
					"priceperunit":$scope.priceperunit,
					"frombalance":$scope.frombalance,
					"tobalance":$scope.tobalance,
					"day":$scope.day,
					"requisiton_type":$scope.requisiton_type,
					"description":$scope.description,
					"amount":$scope.amount,
					"ajax_type":"add",
					"docno":$scope.docno},
	          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	          
	        }).then(function(response) {
	            $scope.adddata = response.data
	            $scope.docno = $scope.adddata.docno;
	            $scope.selectrequisition($scope.docno,$scope.gcostcode);
	        });
			
		
	}
	
	$scope.selectrequisition = function(docno,gcostcode){
		$http({
	          method: "POST", 
	          url: "ajax_requisition.jsp",
	          params:{"ajax_type":"selectlist",
					"docno":docno,
					"gcostcode":gcostcode},
	          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	          
	        }).then(function(response) {
	            $scope.selectlist = response.data
	        });
	}
	

});