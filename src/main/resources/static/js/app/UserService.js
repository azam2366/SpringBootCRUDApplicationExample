'use strict';

angular.module('crudApp').factory('UserService',
    ['$localStorage', '$http', '$q', 'urls',
        function ($localStorage, $http, $q, urls) {

            var factory = {
                loadAllOrgs: loadAllOrgs,
                getAllOrgs: getAllOrgs,
                loadDemoOrgs: loadDemoOrgs,
                getDemoOrgs: getDemoOrgs,
                loadAllUsers: loadAllUsers,
                getAllUsers: getAllUsers,
                getUser: getUser,
                createUser: createUser,
                updateUser: updateUser,
                removeUser: removeUser
            };

            return factory;

            function loadAllOrgs() {
                console.log('Fetching all orgs');
                var deferred = $q.defer();
                $http.get(urls.ORGS_SERVICE_API)
                    .then(
                        function (response) {
                            console.log('Fetched successfully all orgs');
                            $localStorage.orgs = response.data;
                            deferred.resolve(response);
                        },
                        function (errResponse) {
                            console.error('Error while loading orgs');
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function loadDemoOrgs() {
                console.log('Fetching demo orgs');
                var deferred = $q.defer();
                $http.get(urls.ORGSDEMO_SERVICE_API)
                    .then(
                        function (response) {
                            console.log('Fetched successfully demo orgs');
                            $localStorage.orgsdemo = response.data;
                            deferred.resolve(response);
                        },
                        function (errResponse) {
                            console.error('Error while loading demo orgs');
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function loadAllUsers() {
                console.log('Fetching all users');
                var deferred = $q.defer();
                $http.get(urls.USER_SERVICE_API)
                    .then(
                        function (response) {
                            console.log('Fetched successfully all users');
                            $localStorage.users = response.data;
                            deferred.resolve(response);
                        },
                        function (errResponse) {
                            console.error('Error while loading users');
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function getAllOrgs(){
                return $localStorage.orgs;
            }

            function getDemoOrgs(){
                return $localStorage.orgsdemo;
            }

            function getAllUsers(){
                return $localStorage.users;
            }

            function getUser(id) {
                console.log('Fetching User with id :'+id);
                var deferred = $q.defer();
                $http.get(urls.USER_SERVICE_API + id)
                    .then(
                        function (response) {
                            console.log('Fetched successfully User with id :'+id);
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while loading user with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function createUser(user) {
                console.log('Creating User');
                var deferred = $q.defer();
                $http.post(urls.USER_SERVICE_API, user)
                    .then(
                        function (response) {
                            loadAllUsers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                           console.error('Error while creating User : '+errResponse.data.errorMessage);
                           deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function updateUser(user, id) {
                console.log('Updating User with id '+id);
                var deferred = $q.defer();
                $http.put(urls.USER_SERVICE_API + id, user)
                    .then(
                        function (response) {
                            loadAllUsers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while updating User with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function removeUser(id) {
                console.log('Removing User with id '+id);
                var deferred = $q.defer();
                $http.delete(urls.USER_SERVICE_API + id)
                    .then(
                        function (response) {
                            loadAllUsers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while removing User with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

        }
    ]);