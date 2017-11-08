<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List Demo Bases of Orgs</span></div>
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
                            <input type="text" class="form-control" placeholder="Search da Orgs" ng-model="searchOrg">
                        </div>
                    </div>
                </form>

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th><a href="#" ng-click="sort('displayName')">
                            Display name <span ng-show="sortType == 'displayName' && !sortReverse" class="fa fa-caret-down"></span>
                            <span ng-show="sortType == 'displayName' && sortReverse" class="fa fa-caret-up"></span></a></th>
                        <th><a href="#" ng-click="sort('distinguishedName')">
                            Distinguished name <span ng-show="sortType == 'distinguishedName' && !sortReverse" class="fa fa-caret-down"></span>
                            <span ng-show="sortType == 'distinguishedName' && sortReverse" class="fa fa-caret-up"></span></a></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr dir-paginate="o in ctrl.getDemoOrgs() | orderBy:sortType:sortReverse | filter:searchOrg | itemsPerPage: pageSize">
                        <td>{{o.displayName}}</td>
                        <td>{{o.distinguishedName}}</td>
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