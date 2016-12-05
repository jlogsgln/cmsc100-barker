//I will use camelCase here for functions 
'use strict';

(function(){
	angular
		.module('app')
		.factory('TwitterService', TwitterService);

	TwitterService.$inject = ['$http', '$q'];

	const headers = {
	    'content-type': 'application/x-www-form-urlencoded'
	};

	function TwitterService($http, $q) {
		const signIn = function(data){
			let deferred = $q.defer();

			console.log(data);
			$http({
				method: 'POST',
				params: data,
				url: '/todo/sign_in',
				headers: headers
			})
			.then((res) => {
				deferred.resolve(res.data);
			}, (err) => {
				deferred.reject(err);
			});

			return deferred.promise;
		}


		const createAccount = function(data){
			let deferred = $q.defer();

			console.log(data);
			$http({
				method: 'POST',
				params: data,
				url: '/todo/create_account',
				headers: headers
			})
			.then((res) => {
				deferred.resolve(res.data);
			}, (err) => {
				deferred.reject(err);
			});

			return deferred.promise;
		}


		let service = {};
        service.createAccount = createAccount;
        service.signIn = signIn;
        return service;
	}
})();