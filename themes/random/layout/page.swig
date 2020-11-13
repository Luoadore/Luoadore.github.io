{% extends 'includes/layout.swig' %}
{% block body %}
  <article id="page">
    <style>
      .interests{
        text-align: center;
      }
      .interests-tag{
        display: inline-block;
        font-size: 30px;
        color: #333;
        padding: 10px 20px;
        text-decoration: none !important;
      }
      .interests-tag:hover{
        background: #eee;
      }
    </style>
    {% set page_title = page.title %}
    {% if 'categories' === page.type %}
      <h1 class="center-title">{{ page_title || __('category_title') }}</h1>
      {{ list_categories() }}
    {% elif 'tags' === page.type %}
      <div style="padding: 10px;">
        <h1 class="center-title">{{ page_title || __('tag_title') }}</h1>
        <div class="tag-cloud-tags">
          {{ tagcloud({min_font: 16, max_font: 32, amount: 200, color: true, start_color: '#999', end_color: '#444'}) }}
        </div>
      </div>
    {% elif 'interests' === page.type %}
      <div style="padding: 10px;">
        <h1 class="center-title">{{ page_title || __('interests_title') }}</h1>
        <div class="interests">
          {% for interest in page.interests.split(',') %}
            <a 
              class="interests-tag"
              href="{{ '/' + interest }}">{{ interest }}</a>
          {% endfor %}
        </div>
      </div>
    {% elif 'hobby' === page.type %}
      <div style="padding: 10px 0;background:#eee;">
        <h1 class="center-title">{{ page_title || __('interests_title') }}</h1>
        {% include 'includes/hobbyList.swig' %}
      </div>
    {% elif 'videoDetail' === page.type %}
      <div style="padding: 10px;">
        <h1 class="center-title">{{ page_title || __('interests_title') }}</h1>
        {% include 'includes/videoDetail.swig' %}
      </div>
    {% elif 'photo' === page.type %}
      <div style="padding: 10px 0;background:#eee;">
      <h1 class="center-title">{{ page_title || __('interests_title') }}</h1>
      <div class="center-title">
        {% for photo in page.list %}
          <a class="fancybox-thumb" rel="fancybox-thumb" href="{{url_for(photo.src)}}">
            <img src="{{url_for(photo.src)}}" />
          </a>
        {% endfor %}
      </div>
      </div>
    {% else %}
      <div style="padding: 10px;">
      <h1 class="">{{ page_title }}</h1>
      {% if page.photos.length %}
        {% include 'includes/gallery.swig' %}
      {% endif %}
      {% autoescape false %}{{page.content }}{% endautoescape %}
      {% if page.comments && (theme.valine.enable) %}
        {% include 'includes/valine.swig' %}
      {% endif %}
      </div>
    {% endif %}
  </article>

  {% include 'includes/pagination.swig' %}
  {% include 'includes/jiathis.swig' %}
{% endblock %}
