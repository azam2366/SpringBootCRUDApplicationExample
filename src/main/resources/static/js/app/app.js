var app = angular.module('crudApp', ['ui.router','ngStorage','angularUtils.directives.dirPagination']);

app.constant('urls', {
    BASE: '/',
    USER_SERVICE_API : '/api/user/',
    ORGS_SERVICE_API : '/api/org/',
    ORGSDEMO_SERVICE_API : '/api/orgdemo/'
});

app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
        $urlRouterProvider.when('', '/list');
        $stateProvider
            .state('list', {
                url: '/list',
                templateUrl: 'partials/list',
                controller:'UserController',
                controllerAs:'ctrl',
                resolve: {
                    users: function ($q, UserService) {
                        console.log('Load all orgs');
                        var deferred = $q.defer();
                        UserService.loadAllOrgs().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            })
            .state('listdemo', {
                url: '/listdemo',
                templateUrl: 'partials/listdemo',
                controller:'UserController',
                controllerAs:'ctrl',
                resolve: {
                    users: function ($q, UserService) {
                        console.log('Load demo orgs');
                        var deferred = $q.defer();
                        UserService.loadDemoOrgs().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            });
        $urlRouterProvider.otherwise('/');
    }]);