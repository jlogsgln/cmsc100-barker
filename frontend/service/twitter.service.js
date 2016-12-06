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

		const signOut = function(){
			let deferred = $q.defer();

			$http({
				method: 'POST',
				url: '/todo/sign_out',
				headers: headers
			})
			.then((res) => {
				deferred.resolve(res.data);
			}, (err) => {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		const getTweets = function(){
			let deferred = $q.defer();

			$http({
				method: 'GET',
				url: '/todo/get_tweets',
				headers: headers
			})
			.then((res) => {
				deferred.resolve(res.data);
			}, (err) => {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		const getLogged = function(){
			let deferred = $q.defer();

			$http({
				method: 'GET',
				url: '/todo/get_logged',
				headers: headers
			})
			.then((res) => {
				deferred.resolve(res.data);
			}, (err) => {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		const getLoggedInfo = function(){
			let deferred = $q.defer();

			$http({
				method: 'GET',
				url: '/todo/get_logged_info',
				headers: headers
			})
			.then((res) => {
				deferred.resolve(res.data);
			}, (err) => {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		const getTweetCount = function(){
			let deferred = $q.defer();

			$http({
				method: 'GET',
				url: '/todo/get_tweetcount',
				headers: headers
			})
			.then((res) => {
				deferred.resolve(res.data);
			}, (err) => {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		const getFollowersCount = function(){
			let deferred = $q.defer();

			$http({
				method: 'GET',
				url: '/todo/get_followerscount',
				headers: headers
			})
			.then((res) => {
				deferred.resolve(res.data);
			}, (err) => {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		const postTweet = function(data){
			let deferred = $q.defer();

			$http({
				method: 'POST',
				params: data,
				url: '/todo/post_tweet',
				headers: headers
			})
			.then((res) => {
				deferred.resolve(res.data);
			}, (err) => {
				deferred.reject(err);
			});

			return deferred.promise;
		}

		const deleteTweet = function(tweet){
			let deferred = $q.defer();

			console.log(tweet);
			$http({
				method: 'DELETE',
				params: tweet,
				url: '/todo/delete_tweet',
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
        service.signOut = signOut;
        service.getTweets = getTweets;
        service.getLogged = getLogged;
        service.getTweetCount = getTweetCount;
        service.getFollowersCount = getFollowersCount;
        service.postTweet = postTweet;
        service.deleteTweet = deleteTweet;
        return service;
	}
})();