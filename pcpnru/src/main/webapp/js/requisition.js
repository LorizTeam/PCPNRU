(function(angular) {
var app = angular.module('requisition', []);
app.controller('myCtrl', function($scope, $http) {
	$scope.unit=0;
	$scope.priceperunit=0;
	$scope.frombalance=0;
	$scope.tobalance=0;
	
	$scope.projectchange = function() {
		
			
			$scope.gcostcode = '';
		
			$http({
		          method: "POST", 
		          url: "ajax_requisition.jsp",
		          params:{"projectCode":$scope.project.split(' - ')[0],"year":$scope.project.split(' - ')[1]},
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
		
		
	
	
});

})(window.angular);
