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
                        {% for oEntity in oEntityCollection %}
                            <a href="#" class="list-group-item" data-entity="{{sResultEntity}}" data-view="" title="Plus de details">
                                {{oEntity}}
                            </a> 
                        {% endfor %}
                    </div>
                </div>
            </div>
        </div>
        {% endif %}
    {% endfor %}
</div>
{% else %}
<div class="col-md-12 alert alert-info">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <h1>Aucun résultat trouvé</h1>
    <p>Aucun enregistrement ne correspond à votre recherche, veuiller affiner vos critères ou essayer une autres recherche.</p>
</div>
{% endif %}
