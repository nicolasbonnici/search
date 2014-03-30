{% if aResults|Exists %}
    <ul class="list-group">
    </ul>
    {% for sResultEntity, oEntityCollection in aResults %}
      <li class="list-group-item">
        <span class="badge">{{oEntityCollection.count}}</span>
        {{sResultEntity}}
      </li>
    {% endfor %}
{% endif %}
