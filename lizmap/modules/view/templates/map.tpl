{meta_html csstheme 'css/main.css'}
{meta_html csstheme 'css/map.css'}
{meta_html csstheme 'css/media.css'}

<div id="header">
  <div id="logo">
    <h1>{$repositoryLabel}</h1>
  </div>
  <div id="title">
    <h1>
    {if $WMSServiceTitle}
      {$WMSServiceTitle}
    {else}
      {@view~map.title.h1@}
    {/if}
    </h1>
  </div>
</div>

<div id="headermenu" class="navbar navbar-fixed-top">
  <div id="auth" class="navbar-inner">
  <div class="pull-right">
    <form id="nominatim-search" class="navbar-search pull-left dropdown">
      <input id="search-query" type="text" class="search-query" placeholder="{@view~map.search.nominatim.placeholder@}"></input>
      <span class="search-icon">
        <button class="icon nav-search" type="submit" tabindex="-1">
          <span>{@view~map.search.nominatim.button@}</span>
        </button>
      </span>
      <div class="dropdown-menu pull-right">
        <div class="dropdown-caret">
          <div class="caret-outer"></div>
          <div class="caret-inner"></div>
        </div>
        <div class="dropdown-inner">
          <ul class="items"></ul>
        </div>
      </div>
    </form>
    <ul class="nav">
      <li class="home">
        <a href="{jurl 'view~default:index'}" rel="tooltip" data-original-title="{@view~default.repository.list.title@}" data-placement="bottom" href="#">
          <span class="icon"></span>
        </a>
      </li>
      <li class="map">
        <a id="toggleLegend" rel="tooltip" data-original-title="{@view~map.map.only@}" data-placement="bottom" href="#">
          <span class="icon"></span>
        </a>
        <span id="toggleLegendOn" value="{@view~map.legend@}"/>
        <span id="toggleMapOn" value="{@view~map.map@}"/>
        <span id="toggleLegendMapOn" value="{@view~map.legend.map@}"/>
        <span id="toggleMapOnlyOn" value="{@view~map.map.only@}"/>
      </li>
      <li class="locate">
        <a id="toggleLocate" rel="tooltip" data-original-title="{@view~map.locatemenu.title@}" data-placement="bottom" href="#">
          <span class="icon"></span>
        </a>
      </li>
      <li class="information">
        <a id="displayMetadata" rel="tooltip" data-original-title="{@view~map.metadata.link.label@}" data-placement="bottom" href="#">
          <span class="icon"></span>
        </a>
      </li>
      <li class="print">
        <a id="togglePrint" rel="tooltip" data-original-title="{@view~map.print.navbar.title@}" data-placement="bottom" href="#">
          <span class="icon"></span>
        </a>
      </li>
      <li class="annotation dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="annotation" data-original-title="{@view~annotation.navbar.title@}" data-placement="bottom" rel="tooltip">
          <span class="icon"></span>
          <span class="caret"></span>
        </a>
        <ul class="dropdown-menu pull-right">
          <li><a id="annotation-point" href="#">{@view~annotation.navbar.title.point@}</a></li>
          <li><a id="annotation-line" href="#">{@view~annotation.navbar.title.line@}</a></li>
          <li><a id="annotation-polygon" href="#">{@view~annotation.navbar.title.polygon@}</a></li>
        </ul>
      </li>
      <li class="measure dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="measure" data-original-title="{@view~map.measure.navbar.title@}" data-placement="bottom" rel="tooltip">
          <span class="icon"></span>
          <span class="caret"></span>
        </a>
        <ul class="dropdown-menu pull-right">
          <li><a id="measure-length" href="#">{@view~map.measure.navbar.title.length@}</a></li>
          <li><a id="measure-area" href="#">{@view~map.measure.navbar.title.area@}</a></li>
          <li><a id="measure-perimeter" href="#">{@view~map.measure.navbar.title.perimeter@}</a></li>
        </ul>
      </li>
      <li class="geolocate">
        <a id="toggleGeolocate" rel="tooltip" data-original-title="{@view~map.geolocate.navbar.title@}" data-placement="bottom" href="#">
          <span class="icon"></span>
        </a>
      </li>
      {if $isConnected}
      <li class="user dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="user-info">
          <span class="icon"></span>
          <span class="text"><b id="info-user-login">{$user->login|eschtml}</b></span>
          <span class="caret"></span>
        </a>
        <ul class="dropdown-menu pull-right">
          {ifacl2 'auth.user.view'}
          <li><a href="{jurl 'jauthdb_admin~user:index', array('j_user_login'=>$user->login)}">{@master_admin~gui.header.your.account@}</a></li>
          {/ifacl2}
          <li><a href="{jurl 'jauth~login:out'}">{@view~default.header.disconnect@}</a></li>
        </ul>
      </li>
      {else}
      <li class="login">
        <a href="{jurl 'jauth~login:form'}">
          <span class="icon"></span>
          <span class="text"><b>{@view~default.header.connect@}</b></span>
        </a>
      </li>
      {/if}
    </ul>
  </div>
  </div>

</div>

<div id="content">

  <span class="ui-icon ui-icon-open-menu" style="display:none;" title="{@view~map.menu.show.hover@}"></span>

  <div id="menu">
    <div id="close-menu" style="display:none;" title="{@view~map.menu.close.hover@}">
      <span class="ui-icon ui-icon-close-menu"></span>
    </div>
    <div id="toolbar">
      <div id="annotation-point-menu" class="annotation" style="display:none;">
        <h3><span class="title"><button id="annotation-point-stop" class="btn btn-stop btn-mini btn-link" title="{@view~map.toolbar.content.stop@}"></button><span class="icon"></span>&nbsp;<span class="text">{@view~annotation.toolbar.title.point@}</span></span></h3>
      </div>
      <div id="annotation-line-menu" class="annotation" style="display:none;">
        <h3><span class="title"><button id="annotation-line-stop" class="btn btn-stop btn-mini btn-link" title="{@view~map.toolbar.content.stop@}"></button><span class="icon"></span>&nbsp;<span class="text">{@view~annotation.toolbar.title.line@}</span></span></h3>
      </div>
      <div id="annotation-polygon-menu" class="annotation" style="display:none;">
        <h3><span class="title"><button id="annotation-polygon-stop" class="btn btn-stop btn-mini btn-link" title="{@view~map.toolbar.content.stop@}"></button><span class="icon"></span>&nbsp;<span class="text">{@view~annotation.toolbar.title.polygon@}</span></span></h3>
      </div>
      <div id="measure-length-menu" class="measure" style="display:none;">
        <h3><span class="title"><button id="measure-length-stop" class="btn btn-stop btn-mini btn-link" title="{@view~map.toolbar.content.stop@}"></button><span class="icon"></span>&nbsp;<span class="text">{@view~map.measure.toolbar.title.length@}</span></span></h3>
      </div>
      <div id="measure-area-menu" class="measure" style="display:none;">
        <h3><span class="title"><button id="measure-area-stop" class="btn btn-stop btn-mini btn-link" title="{@view~map.toolbar.content.stop@}"></button><span class="icon"></span>&nbsp;<span class="text">{@view~map.measure.toolbar.title.area@}</span></span></h3>
      </div>
      <div id="measure-perimeter-menu" class="measure" style="display:none;">
        <h3><span class="title"><button id="measure-perimeter-stop" class="btn btn-stop btn-mini btn-link" title="{@view~map.toolbar.content.stop@}"></button><span class="icon"></span>&nbsp;<span class="text">{@view~map.measure.toolbar.title.perimeter@}</span></span></h3>
      </div>
      <div id="locate-menu" class="locate" style="display:none;">
        <h3><span class="title"><button class="btn-locate-clear btn btn-mini btn-link" type="button"></button><span class="icon"></span>&nbsp;{@view~map.locatemenu.title@}</span></span></h3>
        <div class="menu-content">
          <div id="locate">
          </div>
        </div>
      </div>
    </div>
    <div id="switcher-menu" class="switcher">
      <h3><span class="title"><span class="icon"></span>&nbsp;<span class="text">{@view~map.switchermenu.title@}</span></span></h3>
      <div class="menu-content">
        <div id="switcher"></div>
      </div>
    </div>
    <div id="baselayer-menu" class="baselayer">
      <h3><span class="title"><span class="icon"></span>&nbsp;<span class="text">{@view~map.baselayermenu.title@}</span></span></h3>
      <div class="menu-content">
        <div class="baselayer-select">
          <select id="baselayer-select" class="label"></select>
        </div>
      </div>
    </div>
  </div>
  <div id="map-content">
    <div id="map"></div>
    <span id="navbar">
      <button class="pan ui-state-select" title="{@view~map.navbar.pan.hover@}"></button><br/>
      <button class="zoom" title="{@view~map.navbar.zoom.hover@}"></button><br/>
      <button class="zoom-extent" title="{@view~map.navbar.zoomextent.hover@}"></button><br/>
      <button class="zoom-in" title="{@view~map.navbar.zoomin.hover@}"></button><br/>
      <div class="slider" title="{@view~map.navbar.slider.hover@}"></div>
      <button class="zoom-out" title="{@view~map.navbar.zoomout.hover@}"></button>
      <div class="history"><button class="previous" title="{@view~map.navbar.previous.hover@}"></button><button class="next" title="{@view~map.navbar.next.hover@}"></button></div>
      <span id="zoom-in-max-msg" class="ui-widget-content ui-corner-all" style="display:none;">{@view~map.message.zoominmax@}</span>
    </span>
    <div id="overview-box">
      <div id="overviewmap" title="{@view~map.overviewmap.hover@}"></div>
      <div id="overview-bar">
        <div id="scaleline" class="olControlScaleLine" style="width:100px; position:relative; bottom:0; top:0; left:0;" title="{@view~map.overviewbar.scaleline.hover@}">
        </div>
        <div id="scaletext" class="label" style="position:absolue; bottom:0; top:0; left:100px; right:20px; position:absolute; text-align:center; padding:0.7em 0 0 0;" title="{@view~map.overviewbar.scaletext.hover@}">{@view~map.overviewbar.scaletext.title@}</div>
        <button class="button" title="{@view~map.overviewbar.displayoverview.hover@}"></button>
      </div>
    </div>
    <div id="attribution-box">
      <span id="attribution"></span>
      {image $j_basepath.'css/img/logo_footer.png'}
    </div>
    <div id="message" class="span6">{jmessage_bootstrap}</div>
  </div>

  <div id="metadata">
    <div class="row">
      <div class="span4 offset1">
        <h2>{@view~map.metadata.h2.illustration@}</h2>
        <p>
          <img src="{jurl 'view~media:illustration', array('repository'=>$repository,'project'=>$project)}" alt="project image" class="img-polaroid liz-project-img">
        </p>
      </div>

      <div class="span5 offset1">
        <h2>{@view~map.metadata.h2.description@}</h2>
        <p>
          <dl class="dl-horizontal">
            <dt>{@view~map.metadata.description.title@}</dt>
            <dd>{$WMSServiceTitle}</dd>
            <dt>{@view~map.metadata.description.abstract@}</dt>
            <dd>{$WMSServiceAbstract}</dd>
          </dl>
        </p>
      </div>

      <div class="span4 offset1">
        <h2>{@view~map.metadata.h2.properties@}</h2>
        <p>
          <dl class="dl-horizontal">
            <dt>{@view~map.metadata.properties.projection@}</dt>
            <dd><small>{$ProjectCrs}</small></dd>
            <dt>{@view~map.metadata.properties.extent@}</dt>
            <dd><small>{$WMSExtent}</small></dd>
          </dl>
        </p>
      </div>
    </div>

    <div class="row">
      <div class="span5 offset1">
        <h2>{@view~map.metadata.h2.contact@}</h2>
        <p>
          <dl class="dl-horizontal">
            <dt>{@view~map.metadata.contact.organization@}</dt>
            <dd>{$WMSContactOrganization}</dd>
            <dt>{@view~map.metadata.contact.person@}</dt>
            <dd>{$WMSContactPerson}</dd>
            <dt>{@view~map.metadata.contact.email@}</dt>
            <dd>{$WMSContactMail|replace:'@':' (at) '}</dd>
            <dt>{@view~map.metadata.contact.phone@}</dt>
            <dd>{$WMSContactPhone}</dd>
          </dl>
        </p>
      </div>
      <div class="span7">
        <h2>{@view~map.metadata.h2.resources@}</h2>
        <p>
          <dl class="dl-horizontal">
            <dt>{@view~map.metadata.resources.website@}</dt>
            <dd><a href="{$WMSOnlineResource}" target="_blank">{$WMSOnlineResource}</a></dd>
          </dl>
        </p>
      </div>
    </div>

    <div class="row">
      <div class="span4 offset8">
        <span class="btn" id="hideMetadata">{@view~map.metadata.hide@}</span>
      </div>
    </div>
  </div>
</div>

<div id="loading" class="ui-dialog-content ui-widget-content" title="{@view~map.loading.title@}">
  <p>
    {image $j_themepath.'css/img/loading.gif'}
  </p>
</div>

<div id="annotation-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-show="false" data-keyboard="false" data-backdrop="static">
</div>
