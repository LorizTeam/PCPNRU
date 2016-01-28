(function(angular) {
var app = angular.module('requisition', []);
app.controller('myCtrl', function($scope, $http) {
	
	$scope.projectchange = function() {
		
		
			$scope.gcostcode = '';
		
			$http({
		          method: "POST", 
		          url: "ajax_receive-1.jsp",
		          params:{"projectCode":$scope.project,"year":"2559"}
		          
		        }).then(function(response) {
		        	$scope.status = response.status;
		            $scope.datas = response.data;
		            
		        });
		}
		
		
		
	
	
});

})(window.angular);
