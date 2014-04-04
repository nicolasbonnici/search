<div class="col-md-12">
    <span class="pull-left">
        <span class="text-lg"><span class="glyphicon glyphicon-search"></span> Résultats</span>
    </span>
    <span class="pull-right">
        <a href="#" class="btn btn-sm btn-primary ui-pane-toggle" data-pane="west" title="Fermer ce panel">
            <span class="glyphicon glyphicon-arrow-left"></span>
        </a>
    </span>
</div>
{% if aResults|Exists %}
<div class="panel-group" id="accordion">
    {% for sResultEntity, oEntityCollection in aResults %} 
        {% set bHandled = 0 %}
        {% if oEntityCollection.count > 0 %}
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a
                        data-toggle="collapse"
                        data-parent="#accordion"
                        href="#results-{{sResultEntity}}"> {{sResultEntity}} <span class="badge blackTextShadow">{{oEntityCollection.count}}
                            {% if oEntityCollection.count >= iMaxLoadCount %}+{% endif %}</span>
                    </a>
                </h4>
            </div>
            <div
                id="results-{{sResultEntity}}"
                class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="list-group">
                    {% if sResultEntity === 'FeedItem' %}
                        {% set bHandled = 1 %}
                        {% for oEntity in oEntityCollection %}
                            <a href="#modal" 
                                class="btn btn-link ui-sendxhr list-group-item" 
                                data-selector="#modal-content" 
                                data-toggle="modal"
                                data-url="/frontend/activities/read/" 
                                data-entity="{{sResultEntity}}" 
                                data-pk="{{oEntity.pk}}" 
                                title="Plus de details">
                                {{oEntity.title|safe|Substr : '0,30'}} [...]
                            </a> 
                        {% endfor %}
                    {% endif %}
                    {% if sResultEntity === 'Post' %}
                        {% set bHandled = 1 %}
                        {% for oEntity in oEntityCollection %}
                            <a href="#modal" 
                                class="btn btn-link ui-sendxhr list-group-item" 
                                data-selector="#modal-content" 
                                data-toggle="modal"
                                data-url="/blog/posts/read/" 
                                data-entity="{{sResultEntity}}" 
                                data-idpost="{{oEntity.pk}}" 
                                title="Plus de details">
                                {{oEntity.title|safe|Substr : '0,30'}} [...]
                            </a> 
                        {% endfor %}
                    {% endif %}
                    {% if sResultEntity === 'Todo' %}
                        {% set bHandled = 1 %}
                        {% for oEntity in oEntityCollection %}
                            <a href="#modal" 
                                class="btn btn-link ui-sendxhr list-group-item" 
                                data-selector="#modal-content" 
                                data-toggle="modal"
                                data-url="/crud/read/" 
                                data-entity="{{sResultEntity}}" 
                                data-pk="{{oEntity.pk}}" 
                                data-view="todo/read.tpl" 
                                title="Plus de details">
                                {{oEntity.label|safe|Substr : '0,30'}} [...]
                            </a> 
                        {% endfor %}
                    {% endif %}
                    {% if bHandled === 0 %}
                        {% for oEntity in oEntityCollection %}
                            <a href="#" class="list-group-item" data-entity="{{sResultEntity}}" data-view="" title="Plus de details">
                                {{oEntity}}
                            </a> 
                        {% endfor %}
                    {% endif %}
                    </div>
                </div>
            </div>
        </div>
        {% endif %}
    {% endfor %}
</div>
{% else %}
<div class="col-md-12 alert alert-info">
  <h1>Aucun résultat trouvé</h1>
  <p>Aucun enregistrement ne correspond à votre recherche, veuiller affiner vos critères ou essayer une autres recherche.</p>
</div>
{% endif %}
