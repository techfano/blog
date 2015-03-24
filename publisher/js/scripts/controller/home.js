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

    	$scope.seeArticle=function(url){
			location.href="#/articulo/"+url
		}

    	
    	/*var params={
    		appId : '12345'
    	}

		var lastPosts = promisesFactory.get('obtain/table/post',params);

		var autor = function(id,params){
			return promisesFactory.get('obtain/queryValue/autor/id/'+id,params);
		}

		lastPosts.then(function(data) {

			$scope.lastPosts=data;

			angular.forEach($scope.lastPosts,function(value,key){
				
				autor(value.autor_id,params).then(function(data) {
					value.autor_alias=data[0].alias;
				},function(reason){});

			})

		},function(reason){});

		$scope.seeArticle=function(id,url){
			alert(0)
			location.href="#/articulo/"+id+"/"+url
		}*/

    }]);

});