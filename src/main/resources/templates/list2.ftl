<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">User #2</span></div>
		<div class="panel-body">
	        <div class="formcontainer">
	            <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
	            <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
	            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
	                <input type="hidden" ng-model="ctrl.user.id" />
	                <div class="row">
	                    <div class="form-group col-md-12">
	                        <label class="col-md-2 control-lable" for="uname">Name</label>
	                        <div class="col-md-7">
	                            <input type="text" ng-model="ctrl.user.name" id="uname" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>
	                        </div>
	                    </div>
	                </div>

	                <div class="row">
	                    <div class="form-group col-md-12">
	                        <label class="col-md-2 control-lable" for="age">Age</label>
	                        <div class="col-md-7">
	                            <input type="text" ng-model="ctrl.user.age" id="age" class="form-control input-sm" placeholder="Enter your Age." required ng-pattern="ctrl.onlyIntegers"/>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="row">
	                    <div class="form-group col-md-12">
	                        <label class="col-md-2 control-lable" for="salary">Salary</label>
	                        <div class="col-md-7">
	                            <input type="text" ng-model="ctrl.user.salary" id="salary" class="form-control input-sm" placeholder="Enter your Salary." required ng-pattern="ctrl.onlyNumbers"/>
	                        </div>
	                    </div>
	                </div>

	                <div class="row">
	                    <div class="form-actions floatRight">
	                        <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid || myForm.$pristine">
	                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
	                    </div>
	                </div>
	            </form>
    	    </div>
		</div>	
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of Users #2</span></div>
		<div class="panel-body">
			<div class="table-responsive">
                <div class="alert alert-info">
                    <p>Sort Type: {{ sortType }}</p>
                    <p>Sort Reverse: {{ sortReverse }}</p>
                    <p>Search Query: {{ searchUser }}</p>
                </div>

                <form>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-search"></i></div>
                            <input type="text" class="form-control" placeholder="Search da User" ng-model="searchUser">
                        </div>
                    </div>
                </form>

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th><a href="#" ng-click="sort('id')">
                            ID <span ng-show="sortType == 'id' && !sortReverse" class="fa fa-caret-down"></span>
                            <span ng-show="sortType == 'id' && sortReverse" class="fa fa-caret-up"></span></a></th>
                        <th><a href="#" ng-click="sort('name')">
                            NAME <span ng-show="sortType == 'name' && !sortReverse" class="fa fa-caret-down"></span>
                            <span ng-show="sortType == 'name' && sortReverse" class="fa fa-caret-up"></span></a></th>
                        <th><a href="#" ng-click="sort('age')">
                            AGE <span ng-show="sortType == 'age' && !sortReverse" class="fa fa-caret-down"></span>
                            <span ng-show="sortType == 'age' && sortReverse" class="fa fa-caret-up"></span></a></th>
                        <th><a href="#" ng-click="sort('salary')">
                            SALARY <span ng-show="sortType == 'salary' && !sortReverse" class="fa fa-caret-down"></span>
                            <span ng-show="sortType == 'salary' && sortReverse" class="fa fa-caret-up"></span></a></th>
                        <th width="100"></th>
                        <th width="100"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr dir-paginate="u in ctrl.getAllUsers() | orderBy:sortType:sortReverse | filter:searchUser | itemsPerPage: pageSize">
                        <td>{{u.id}}</td>
                        <td>{{u.name}}</td>
                        <td>{{u.age}}</td>
                        <td>{{u.salary}}</td>
                        <td>
                            <button type="button" ng-click="ctrl.editUser(u.id)" class="btn btn-success custom-width">
                                Edit
                            </button>
                        </td>
                        <td>
                            <button type="button" ng-click="ctrl.removeUser(u.id)" class="btn btn-danger custom-width">
                                Remove
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="pag">
                    <div id="con1">
                        <dir-pagination-controls
                                max-size="5"
                                direction-links="true"
                                boundary-links="true"
                                on-page-change="true"
                                auto-hide="true">
                        </dir-pagination-controls>
                    </div>
                    <div id="con2">
                        <div id="pagesize" class="input-group">
                            <div class="input-group-addon"><i class="fa fa-bars"></i></div>
                            <input type="text" class="form-control" placeholder="Number of pages"
                                   ng-model="pageSize">
                        </div>
                    </div>
                </div>
            </div>
		</div>
    </div>
</div>