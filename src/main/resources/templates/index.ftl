<!DOCTYPE html>

<html lang="en" ng-app="crudApp">
    <head>
        <title>${title}</title>
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <link href="css/app.css" rel="stylesheet"/>
        <link href="css/font-awesome.min.css" rel="stylesheet"/>
    </head>
    <body>
        <!-- NAVIGATION -->
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" ui-sref="#">AngularUI Router</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a ui-sref="list">Home</a></li>
                <li><a ui-sref="listdemo">Demo base of organisations</a></li>
            </ul>
        </nav>

        <div ui-view></div>
        <script src="js/lib/angular.min.js" ></script>
        <script src="js/lib/angular-ui-router.min.js" ></script>
        <script src="js/lib/localforage.min.js" ></script>
        <script src="js/lib/ngStorage.min.js"></script>
        <script src="js/lib/dirPagination.js"></script>
        <script src="js/app/app.js"></script>
        <script src="js/app/UserService.js"></script>
        <script src="js/app/UserController.js"></script>
    </body>
</html>