<ul class="social-icon">
  {% set socialConfig = config.social || theme.social %}
  {% for i in Object.keys( socialConfig ) %}
    <li>
      {% if i === 'email' %}
        {% set url = 'mailto:' + socialConfig[i] %}
      {% else %}
        {% set url = socialConfig[i] %}
      {% endif %}
      <a href="{{ url }}">
        {% if i==='GitHub' %}
          <i class="icon iconfont icongithub" title="github"></i> 
        {% elseif i==='email' %}
          <i class="icon iconfont iconyoujian" title="github"></i> 
        {% elseif i==='GoogleSchilar' %}
          <i class="icon iconfont icongoogle" title="github"></i>
        {% elseif i==='LinkedIn' %}
          <i class="icon iconfont iconlinkedin" title="github"></i>
        {% else %}
          {{i}}
        {% endif %}
      </a>
    </li>
  {% endfor %}
</ul>