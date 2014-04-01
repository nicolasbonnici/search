{% extends 'layout.tpl' %} {% block favicon %}/lib/img/aps/blog/icon.png{% endblock favicon %} {% block meta_title
%}Search{% endblock meta_title %} {% block meta_description %}A simple blogging application{% endblock meta_description
%} {% block js %}
<script type="text/javascript">
$(document).ready(function() {
    
});
</script>
{% endblock %} {% block css %}
<style>
</style>
{% endblock %} {% block modal %}
<div
    class="modal fade"
    id="modal-post"
    role="dialog"
    aria-labelledby="myModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <div
            class="modal-content"
            id="modal-post-content">
            <p>&nbsp;</p>
        </div>
    </div>
</div>
{% endblock %} {% block main %}
<div class="row clearfix transparentBlackBg rounded well ui-transition ui-shadow">
    <div class="col-md-2 column">
        <img
            src="/lib/bundles/search/icon.png"
            alt="App icon" />
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
                    <nav
                        class="col-md-12 navbar navbar-inverse navbar-default"
                        role="navigation">
                        <div class="container-fluid">
                            <ul class="nav navbar-nav">
                                <li class="active"><a
                                    href="#"
                                    class="ui-sendxhr"
                                    data-url="/search/dashboard/"
                                    data-selector="#dashboard"
                                    role="button"> <span class="glyphicon glyphicon-home"></span> <strong>Dashboard</strong>
                                </a></li>
                                <li><a
                                    href="#"
                                    class="ui-sendxhr refreshOnCallback"
                                    data-url="/search/posts/"
                                    data-selector="#dashboard"
                                    role="button"
                                    title="Gérer les posts"> <span class="glyphicon glyphicon-globe"></span> <strong>Posts</strong>
                                </a></li>
                                <li><a href="#"><span class="glyphicon glyphicon-comment"></span> <strong>Comments</strong></a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown"><a
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    href="#"> <span class="glyphicon glyphicon-cog"></span> <strong>Settings</strong>
                                        <span class="caret"></span>
                                </a>
                                    <ul class="dropdown-menu">
                                        <li><a
                                            href="#"
                                            type="button"
                                            class="ui-sendxhr"
                                            data-url="/search/posts/create/"
                                            data-selector="#modal-post-content"
                                            role="button"
                                            data-toggle="modal"> <span class="glyphicon glyphicon-file"></span> Bla
                                                bla
                                        </a></li>
                                        <li><a
                                            href="#"
                                            type="button"
                                            class="ui-sendxhr"
                                            data-url="/search/posts/"
                                            data-selector="#dashboard"
                                            role="button"> <span class="glyphicon glyphicon-file"></span> Gérer
                                        </a></li>
                                    </ul></li>
                            </ul>
                        </div>
                        <!-- /.container-fluid -->
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div id="dashboard"></div>
</div>
{% endblock %}
