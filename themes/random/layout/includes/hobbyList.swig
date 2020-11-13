
<style>
.hobbyList-wrap{
  width: 500px; 
  margin: 0 auto;
  min-height: 100vh;
}
.hobbyList-Item{
  margin-top: 14px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
  overflow: hidden;
  cursor: pointer;
  padding: 10px;
  background: #fff;
}
.hobbyList-Item-cover{
  height: 320px;
  border-radius: 5px;
  width: 100%;
  background: #eee;
  overflow: hidden;
}

.hobbyList-Item-cover{
  max-width:100%;
  max-height: 100%;
  background-size: cover;
  background-position: 50% 50%;
}

.hobbyList-Item-title{
  padding: 10px 8px;
  box-sizing: border-box;
  overflow:hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
  font-weight: bold;
  width: 100%;
  font-size: 18px;
}
.hobbyList-Item-coverText{
  height: 100%;
  width:100%;
  font-size: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #333;
  opacity: 0.3;
}
</style>

<div class="hobbyList-wrap">
  <div id="list">
    {% if page.list.length > 0 %}
    {% for item in page.list %}
    <div class="hobbyList-Item">
      {% set cover = item.cover %}
      {% if item.id !== '' %}
      <a href="/{{ page.title }}Detail/{{ item.id }}">
      {% endif %}
        <div class="hobbyList-Item-cover" style="background-image: url('{{cover}}')">
          {% if cover === '' %}
            <div class="hobbyList-Item-coverText">
              {% set text = item.text || '敬请期待' %}
              <span>{{ text }}</span>
            </div>
          {% endif %}
        </div>
        <div class="hobbyList-Item-title">{{ item.title }}</div>
      {% if item.id !== '' %}
      </a>
      {% endif %}
    </div>
    {% endfor %}
    {% endif %}
  </div>
</div>
