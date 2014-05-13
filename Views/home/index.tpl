{% extends 'layout.tpl' %}
{% block favicon %}/lib/bundles/{{sBundle}}/img/icon.png{% endblock favicon %} 
{% block meta_title %}Search{% endblock meta_title %}
{% block meta_description %}A simple blogging application{% endblock meta_description %} 

{% block js %}
<script type="text/javascript">
$(document).ready(function() {
    
});
</script>
{% endblock %} 

{% block css %}
<style>
</style>
{% endblock %} 

{% block modal %}
<div class="modal fade" id="modal-post" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="modal-post-content">
            <p>&nbsp;</p>
        </div>
    </div>
</div>
{% endblock %}

{% block main %}
<div class="container">
    <div class="row clearfix transparentBlackBg rounded well ui-transition ui-shadow">
        <div class="col-md-2 column">
            <img src="/lib/bundles/search/img/icon.png" alt="App icon" />
        </div>
        <div class="col-md-10 column">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-12">
                        <h1 class="showOnHover">
                            Search <small class="targetToShow">1.0</small>
                        </h1>
                    </div>
                    <div class="col-md-12">
                        <nav class="col-md-12 navbar navbar-inverse navbar-default" role="navigation">
                            <div class="container-fluid">
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <span class="glyphicon glyphicon-cog"></span> <strong>Settings</strong> <span
                                            class="caret"></span>
                                    </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#" type="button" class="ui-sendxhr"
                                                data-url="/search/posts/create/" data-selector="#modal-post-content"
                                                role="button" data-toggle="modal"> <span
                                                    class="glyphicon glyphicon-file"></span> Bla bla
                                            </a></li>
                                            <li><a href="#" type="button" class="ui-sendxhr" data-url="/search/posts/"
                                                data-selector="#dashboard" role="button"> <span
                                                    class="glyphicon glyphicon-file"></span> Gérer
                                            </a></li>
                                        </ul></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div id="dashboard" class="col-md-12">
            <form id="search-form" class="form-horizontal asynchSendOnSubmit" method="post" action="/search/home/process" data-sendform-reponse-selector="#search-results">
                <fieldset>
                
                <div class="form-group">
                  <label class="col-md-4 control-label" for="search">Your search</label>  
                  <div class="col-md-5">
                  <input id="search" name="search" type="text" placeholder="Enter your search" class="form-control input-md" required="required">
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-4 control-label" for="options">Options</label>
                  <div class="col-md-4">
                  <div class="checkbox">
                    <label for="options-0">
                      <input type="checkbox" name="options" id="options-0" value="1">
                      Strict mode
                    </label>
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-4 control-label" for="entities">Entities</label>
                  <div class="col-md-5">
                    <select id="entities" name="entities[]" class="form-control" multiple="multiple">
                    {% if aEntities|Exists %}
                        {% for sEntity in aEntities %}
                        <option value="{{sEntity}}" selected="selected">{{sEntity}}</option>
                        {% endfor %}
                    {% endif %}
                    </select>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-4 control-label" for="search-submit"></label>
                  <div class="col-md-8 text-right">
                    <button id="search-cancel" name="search-submit" class="btn btn-lg btn-default">Cancel</button>
                    <a href="#" class="btn btn-lg btn-info ui-sendform" data-form="#search-form">Search</a>
                  </div>
                </div>
                
                </fieldset>
            </form>

            <div id="search-results" class="col-md-12">
            
            </div>
        
        </div>
    </div>
</div>
{% endblock %}
