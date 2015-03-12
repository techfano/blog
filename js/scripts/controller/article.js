define(['app'], function (app) {
    app.register.controller('articleCtrl', function ($scope, $routeParams,$sce) {
        
       /* var params={
    		appId : '12345'
    	}
    	
    	var currentPost = promisesFactory.get('/obtain/queryValue/post/id/'+$routeParams.id_p,params);
        
        var currentParagraph = promisesFactory.get('obtain/queryValue/paragraph/post_id/'+$routeParams.id_p,params);

		var autor = function(id,params){
			return promisesFactory.get('obtain/queryValue/autor/id/'+id,params);
		}
		
		currentPost.then(function(data) {
			$scope.post = data[0];
			
			autor($scope.post.autor_id,params).then(function(data) {
				$scope.post.autor_alias=data[0].alias;
			},function(reason){});
			
		});
		
		currentParagraph.then(function(data) {
			$scope.paragraphList = data;
		});
	
		$scope.trustHtml = function(data){
			return $sce.trustAsHtml(data);
	    }*/

    });
}); 