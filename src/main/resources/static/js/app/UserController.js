'use strict';

angular.module('crudApp').controller('UserController',
    ['UserService', '$scope', '$location',  function( UserService, $scope, $location) {

        var self = this;
        self.user = {};
        self.users=[];

        self.orgs=[];
        self.org = {};
        self.orgsdemo=[];
        self.orgbases = [];
        $scope.quotes = [];

        self.submit = submit;
        self.getAllOrgs = getAllOrgs;
        self.getQuotes = getQuotes;
        self.getDemoOrgs = getDemoOrgs;
        self.getBases = getBases;
        self.getAllUsers = getAllUsers;
        self.createUser = createUser;
        self.updateUser = updateUser;
        self.removeUser = removeUser;
        self.editUser = editUser;
        self.reset = reset;

        self.successMessage = '';
        self.errorMessage = '';
        self.done = false;

        self.onlyIntegers = /^\d+$/;
        self.onlyNumbers = /^\d+([,.]\d+)?$/;

        $scope.sortType     = 'displayName'; // set the default sort type
        $scope.sortReverse  = false;  // set the default sort order
        $scope.searchUser   = '';     // set the default search/filter term
        $scope.pageSize   = 5;

        function submit() {
            console.log('Submitting');
            if (self.user.id === undefined || self.user.id === null) {
                console.log('Saving New User', self.user);
                createUser(self.user);
            } else {
                updateUser(self.user, self.user.id);
                console.log('User updated with id ', self.user.id);
            }
        }

        function createUser(user) {
            console.log('About to create user');
            UserService.createUser(user)
                .then(
                    function (response) {
                        console.log('User created successfully');
                        self.successMessage = 'User created successfully';
                        self.errorMessage='';
                        self.done = true;
                        self.user={};
                        $scope.myForm.$setPristine();
                    },
                    function (errResponse) {
                        console.error('Error while creating User');
                        self.errorMessage = 'Error while creating User: ' + errResponse.data.errorMessage;
                        self.successMessage='';
                    }
                );
        }


        function updateUser(user, id){
            console.log('About to update user');
            UserService.updateUser(user, id)
                .then(
                    function (response){
                        console.log('User updated successfully');
                        self.successMessage='User updated successfully';
                        self.errorMessage='';
                        self.done = true;
                        $scope.myForm.$setPristine();
                    },
                    function(errResponse){
                        console.error('Error while updating User');
                        self.errorMessage='Error while updating User '+errResponse.data;
                        self.successMessage='';
                    }
                );
        }


        function removeUser(id){
            console.log('About to remove User with id '+id);
            UserService.removeUser(id)
                .then(
                    function(){
                        console.log('User '+id + ' removed successfully');
                    },
                    function(errResponse){
                        console.error('Error while removing user '+id +', Error :'+errResponse.data);
                    }
                );
        }

        function getAllOrgs(){
            return UserService.getAllOrgs();
        }

        function getQuotes(){
            return $scope.quotes;
        }

        function getDemoOrgs(){
            return UserService.getDemoOrgs();
        }

        function getBases(org) {
            UserService.loadBases(org)
                .then(
                    function (response) {
                        console.log('Demo DB load successfully');
                        self.successMessage = 'Demo DB load successfully';
                        self.errorMessage='';
                        self.done = true;
                        $scope.quotes=response.data;
                        $scope.myForm.$setPristine();
                    },
                    function (errResponse) {
                        console.error('Error while Demo DB loading');
                        self.errorMessage = 'Error while Demo DB loading: ' + errResponse.data.errorMessage;
                        self.successMessage='';
                    }
                );
            $location.path("/listquotes");
        }

        function getAllUsers(){
            return UserService.getAllUsers();
        }

        function editUser(id) {
            self.successMessage='';
            self.errorMessage='';
            UserService.getUser(id).then(
                function (user) {
                    self.user = user;
                },
                function (errResponse) {
                    console.error('Error while removing user ' + id + ', Error :' + errResponse.data);
                }
            );
        }

        function reset(){
            self.successMessage='';
            self.errorMessage='';
            self.user={};
            $scope.myForm.$setPristine(); //reset Form
        }

        $scope.sort = function(keyname){
            $scope.sortType = keyname;   //set the sortKey to the param passed
            $scope.sortReverse = !$scope.sortReverse; //if true make it false and vice versa
        }

    }]);