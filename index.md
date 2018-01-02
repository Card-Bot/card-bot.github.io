---
layout: home
---
# All cards
This is a list of all of the cards in CardBot!

{% for entry in site.data %}
  {% assign meetup = entry[1] %}
  <h4>{{ meetup.name }}</h4>
  <img src={{ meetup.link }}></img>
  <p>{{ meetup.description }}</p>
  <p>Packs: {{ meetup.stats.packs }}</p>
  <p>Tags: {{ meetup.stats.tags }}</p>
  <p>Price: {{ meetup.stats.price }}</p>
  <br />
{% endfor %}
