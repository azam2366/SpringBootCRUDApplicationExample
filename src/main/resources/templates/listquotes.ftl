<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List Quote Space of Org </span></div>
		<div class="panel-body">
			<div class="table-responsive">
                <div class="alert alert-info">
                    <p>Sort Type: {{ sortType }}</p>
                    <p>Sort Reverse: {{ sortReverse }}</p>
                    <p>Search Query: {{ searchOrg }}</p>
                </div>

                <form>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-search"></i></div>
                            <input type="text" class="form-control" placeholder="Search da Quote" ng-model="searchQuotes">
                        </div>
                    </div>
                </form>

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th><a href="#" ng-click="sort('user')">
                            User <span ng-show="sortType == 'user' && !sortReverse" class="fa fa-caret-down"></span>
                            <span ng-show="sortType == 'user' && sortReverse" class="fa fa-caret-up"></span></a></th>
                        <th><a href="#" ng-click="sort('diskspaceused')">
                            Disk Space Used <span ng-show="sortType == 'diskspaceused' && !sortReverse" class="fa fa-caret-down"></span>
                            <span ng-show="sortType == 'diskspaceused' && sortReverse" class="fa fa-caret-up"></span></a></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr dir-paginate="o in ctrl.getQuotes() | orderBy:sortType:sortReverse | filter:searchQuotes | itemsPerPage: pageSize">
                        <td>{{o.user}}</td>
                        <td>{{o.diskspaceused}}</td>
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