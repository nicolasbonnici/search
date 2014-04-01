{% if aResults|Exists %}
<h1 class="blackTextShadow">
    <span class="glyphicon glyphicon-search"></span> Results
</h1>
<div class="panel-group" id="accordion">
    {% for sResultEntity, oEntityCollection in aResults %} 
        {% if oEntityCollection.count > 0 %}
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a
                        data-toggle="collapse"
                        data-parent="#accordion"
                        href="#results-{{sResultEntity}}"> {{sResultEntity}} <span class="badge">{{oEntityCollection.count}}
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
                        <a href="#"  class= "list-group-item" title="Plus de details">
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
</div>
{% endif %}
