# Rendering Questions

As discussed in the previous section [packaging questions](packaging-questions.md) the basic definition of an Assessment Item is created using a `config.json` and `index.html` file. The PIE Packaging Tool assembles and packages a javascript runtime for the Assessment Item.

A packaged item will have the following assets:

```
  config.json // the definition and configuration for the PIEs in the assessment item 
  index.html // placement of the PIE Custom Elements in html markup
  pie-player.js // assembled Javascript for rendering the UI for the Assessment Item in <pie-player/>
  controllers.js // the packaged controller code for the PIEs and item.
```

Using these assets the Item can be rendered in the browser. The controller logic can be run entirely on the client, or on the server if that is desired.


## Loading PIE Player

The PIE Player Javascript defines a Custom Element

```html
<script src="pie-player.js"/>
<script src="controllers.js"/>

<pie-player id="pie-player"></pie-player>

<script>

var player = document.querySelector('pie-player');
player.addEventListener('pie-player-ready', function(event){

  // set the controllers
  event.target.controllers = _pie_controllers;
  // add handler methods
  event.target.onSessionChanged = function(session) {}
  // set the env (should also add logic to reset env on change)
  event.target.env = env;
  // set session if loading existing session
  event.target.session = session;
  
});

</script>
```


## Server-side execution of Controller Functions

For implementation of more secure environments, where the full question configuration model is not downloaded to the client (potentially including correct answers) the PIE controller code may be hosted on a server instead of the client.

To support this workflow, an alternate `controllers.js` may be used, that maps the requests to a server endpoint.

TODO - link to doc/section explaining how to do this.


## PIE Player API

TODO