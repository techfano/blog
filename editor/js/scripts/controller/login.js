define(['app'], function (app) {
    app.register.controller('LoginCtrl',['$scope','$resource','$resourceService','$location', function ($scope,$resource,resourceService,$location) {
           
           var token=localStorage.getItem('token');
            
	    	var verify = $resource('http://localhost:4000/api/verify/'+token);

	    	verify.get(function(verify){
	           	$location.path('/dashboard');
	    	},function(error){
	           	$location.path('/login');
	    	});

	    	var user = $resource('http://localhost:4000/api/me/5510578ce4b0e5b0b43a1aa3');

	    	user.get(function(user){
	    		console.log(user);
	    	},function(error){
	    		console.log(error);
	    	});

            $scope.getLogin=function(user){

            	if(user.name && user.password){

	            	var auth = $resource('http://localhost:4000/api/auth/'+user.name+'/'+user.password);

	            	$scope.loading=true;
	        	
	        	    auth.get(function(auth){
	              
	    		        localStorage.setItem("token", auth.token);
			           	delete $scope.loading;
			           	if(auth.token){
				           	$location.path('/dashboard');
			           	}

		            },function(error){

		            	console.log(error)

			           	delete $scope.loading;

		            });

		         }

            };

    }]);

});
