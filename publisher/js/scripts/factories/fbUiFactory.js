'use strict';

define(['app'], function (app) {

	app.factory('fbShareModal', function (fbModal) {
	  return fbModal({
	    controller: 'fbModalCtrl',
	    controllerAs: 'modal',
	    templateUrl: '../template/modal.html'
	  });
	})

	app.controller('fbModalCtrl', function ($scope,fbShareModal) {
	    
	    $scope.close = fbShareModal.deactivate;
	    $scope.publish = fbShareModal.publish;
	    $scope.dataPublish = fbShareModal.dataPublish

	    console.log('scop',$scope)

	})

app.factory('fbModal', function ($compile, $rootScope, $controller, $q, $http, $templateCache,$facebook) {
  return function modalFactory (config) {

    if ((+!!config.template) + (+!!config.templateUrl) !== 1) {
      throw new Error('Expected modal to have exacly one of either `template` or `templateUrl`');
    }

    var template      = config.template,
        controller    = config.controller || angular.noop,
        controllerAs  = config.controllerAs,
        container     = angular.element(config.container || document.body),
        element       = null,
        dataPublish   = null,
        html;

    if (config.template) {
      var deferred = $q.defer();
      deferred.resolve(config.template);
      html = deferred.promise;
    } else {
      html = $http.get(config.templateUrl, {
        cache: $templateCache
      }).
      then(function (response) {
        return response.data;
      });
    }

    function activate (data,locals) {

	  this.dataPublish = data;	  

      html.then(function (html) {
        if (!element) {
          attach(html, locals);
        }
      });
    }

    function attach (html, locals) {
      element = angular.element(html);
      container.prepend(element);
      var scope = $rootScope.$new();
      if (locals) {
        for (var prop in locals) {
          scope[prop] = locals[prop];
        }
      }
      var ctrl = $controller(controller, { $scope: scope });
      if (controllerAs) {
        scope[controllerAs] = ctrl;
      }
      $compile(element)(scope);
    }

    function publish (message) {

    	var args={
			"picture":this.dataPublish.image_url,
			"description":this.dataPublish.resume,
			"link":"http://prodesign.pe/#/articulo/"+this.dataPublish.id+"/"+this.dataPublish.url,
			"name":this.dataPublish.title,
			"caption":"prodesign.pe"
		}

		args.message = message;

		$facebook.api('/me/feed','post',args).then( function(response) {
			deactivate ()
	    },function(err) {
	        console.log(err)
	    });
		
    }

    function deactivate () {
      if (element) {
        element.remove();
        element = null;
      }
    }

    return {
      activate: activate,
      deactivate: deactivate,
      publish: publish,
      dataPublish: dataPublish
    };
  };
});

});



