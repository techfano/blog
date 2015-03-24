define(['app'], function (app) {
    app.register.controller('HomeCtrl',['$scope','services', function ($scope,services) {

    	var post = services.post.all();

    	var autor = function(id){
			return services.autor.getById(id);
    	};

    	post.then(function(data){

    		$scope.lastPosts = data;

    		angular.forEach($scope.lastPosts,function(value,key){

    			autor(value.autor_id).then(function(data) {
					value.autor_alias=data.alias;
				});

    		});

    	});

    	
    	
    

    }]);

});
