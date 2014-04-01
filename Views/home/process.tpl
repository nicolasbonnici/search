{% if aResults|Exists %}
<h1 class="blackTextShadow">
    <span class="glyphicon glyphicon-search"></span> Results
</h1>
<div class="list-group">
    {% for sResultEntity, oEntityCollection in aResults %} <a href="#"
        class="list-group-item{% if oEntityCollection.count > 0 %} active{% endif %}">
    </a> {% endfor %}
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                        href="#collapseOne"> {{sResultEntity}} <span
                        class="badge">{{oEntityCollection.count}}
                            {% if oEntityCollection.count >=
                            iMaxLoadCount %}+{% endif %}</span>
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">Anim pariatur cliche
                    reprehenderit, enim eiusmod high life accusamus
                    terry richardson ad squid. 3 wolf moon officia aute,
                    non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
                    tempor, sunt aliqua put a bird on it squid
                    single-origin coffee nulla assumenda shoreditch et.
                    Nihil anim keffiyeh helvetica, craft beer labore wes
                    anderson cred nesciunt sapiente ea proident. Ad
                    vegan excepteur butcher vice lomo. Leggings occaecat
                    craft beer farm-to-table, raw denim aesthetic synth
                    nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.</div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                        href="#collapseTwo"> Collapsible Group Item
                        #2 </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">Anim pariatur cliche
                    reprehenderit, enim eiusmod high life accusamus
                    terry richardson ad squid. 3 wolf moon officia aute,
                    non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
                    tempor, sunt aliqua put a bird on it squid
                    single-origin coffee nulla assumenda shoreditch et.
                    Nihil anim keffiyeh helvetica, craft beer labore wes
                    anderson cred nesciunt sapiente ea proident. Ad
                    vegan excepteur butcher vice lomo. Leggings occaecat
                    craft beer farm-to-table, raw denim aesthetic synth
                    nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.</div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                        href="#collapseThree"> Collapsible Group
                        Item #3 </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">Anim pariatur cliche
                    reprehenderit, enim eiusmod high life accusamus
                    terry richardson ad squid. 3 wolf moon officia aute,
                    non cupidatat skateboard dolor brunch. Food truck
                    quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
                    tempor, sunt aliqua put a bird on it squid
                    single-origin coffee nulla assumenda shoreditch et.
                    Nihil anim keffiyeh helvetica, craft beer labore wes
                    anderson cred nesciunt sapiente ea proident. Ad
                    vegan excepteur butcher vice lomo. Leggings occaecat
                    craft beer farm-to-table, raw denim aesthetic synth
                    nesciunt you probably haven't heard of them
                    accusamus labore sustainable VHS.</div>
            </div>
        </div>
    </div>
</div>
{% endif %}
