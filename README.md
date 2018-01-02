---
layout: home
---
# <img src="https://card-bot.github.io/assets/image.png" height="128" width="128"><img src="https://card-bot.github.io/assets/logo.png">
[![Discord Bots](https://discordbots.org/api/widget/status/372166132301561866.svg?noavatar=true)](https://discordbots.org/bot/372166132301561866) [![Discord Bots](https://discordbots.org/api/widget/lib/372166132301561866.svg?noavatar=true)](https://discordbots.org/bot/372166132301561866) [![Discord Bots](https://discordbots.org/api/widget/owner/372166132301561866.svg?noavatar=true)](https://discordbots.org/bot/372166132301561866)<br>
The Website for CardBot

<a href="https://github.com/ZippyMagician/CardBot">Github Repository</a>

## About CardBot
CardBot is a fast, powerful, and fun trading card discord bot that adds some excitement to your discord server.

_Isn't this just a copy of Discord Cards?_<br>
No! While Discord Cards does have many of the same features that CardBot has, CardBot is different for 1 very important reason:
Battles are coming! After **Set 2** is released, Battling will be added to CardBot! Stay tuned for that!

## All cards
This is a list of all of the cards in CardBot!

{% for entry in site.data %}
  {% assign meetup = entry[1] %}
  <h3>{{ meetup.name }}</h3>
  <img src={{ meetup.link }}></img>
  <p>{{ meetup.description }}</p>
  <p>Packs: {{ meetup.stats.packs }}</p>
  <p>Tags: {{ meetup.stats.tags }}</p>
  <p>Price: {{ meetup.stats.price }}</p>
  <br />
{% endfor %}
