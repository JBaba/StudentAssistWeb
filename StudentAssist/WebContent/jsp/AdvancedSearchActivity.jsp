
  <style>
    .dropdown-menu {
      left: initial;
    }

  </style>


  <div ng-app="ui.bootstrap.demo" ng-controller="advancedSearchController">

    <div class="row" style="max-width: 100%;overflow-y:hidden;">

      <div class="large-3 columns" style="background: white; max-height: 100%; padding-right: 0; padding-left: 0;">

        <div id="sidebar">

          <%@include file="AdvancedSearchFragment.html"%>


        </div>
      </div>

      <div class="large-9 columns adDetailsInfo" style="height: 100%;">

        <div id="sidebar">

          <%@include file="adDetails.html"%>

        </div>

      </div>


    </div>










  </div>
