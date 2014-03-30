{% if aResults|Exists %}
    <h1 class="blackTextShadow"><span class="glyphicon glyphicon-search"></span> Results</h1>
    <div class="list-group">
    {% for sResultEntity, oEntityCollection in aResults %}
        <a href="#" class="list-group-item{% if oEntityCollection.count > 0 %} active{% endif %}">
            {{sResultEntity}} <span class="badge">{{oEntityCollection.count}} {% if oEntityCollection.count >= iMaxLoadCount %}+{% endif %}</span>
        </a>
    {% endfor %}
    </div>
{% endif %}
