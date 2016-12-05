'use strict';

(function(){
	angular
		.module('app', ['ngRoute'])
		.config(config);

	config.$inject = ['$routeProvider'];

	function config($routeProvider){
		$routeProvider
			.when('/sign_in', {
				'controller' : 'TwitterCtrl',
				'templateUrl': 'view/sign_in.view.html'
			})
			.when('/home', {
				'controller' : 'TwitterCtrl',
				//'templateUrl': 'view/home.view.html'
			})
			.otherwise({'redirectTo': 'sign_in'});
	}
})();