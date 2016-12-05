//I will use snake_case here for functions

'use strict';

(function(){
	angular
		.module('app')
		.controller('TwitterCtrl', TwitterCtrl);

	TwitterCtrl.$inject = ['$scope', '$window', 'TwitterService'];

	function TwitterCtrl($scope, $window, TwitterService) {
		
		$scope.data = {
			fullname: "",
			email: "",
			username: "",
			password: ""
		}

		$scope.sign_in = function(){
			$scope.sign_in_clicked = function(){
				const data = {
					username: $scope.username,
					password: $scope.password
				}

				TwitterService
					.signIn(data)
					.then(function(res){
						$window.location.href = '#/home';
					}, function(err){
						$window.location.href = '#/sign_in';

					})
			}
		}

		$scope.create_account = function(){
			$scope.clicked = function(){	
				const data = {
					fullname: $scope.fullname,
					email: $scope.email,
					username: $scope.username,
					password: $scope.password
				}

				console.log(data);
				TwitterService
					.createAccount(data)
					.then(function(res) {
	            		console.log(res);
	            		alert(res.message);
	            		$window.location.href = '#/sign_in';        
	                }, function(err) {
	                    console.log(err);
	                })
			}
		}


	}
})();