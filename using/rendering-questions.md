# Rendering Questions

As discussed in the previous section [packaging questions](packaging-questions.md) the basic definition of an Assessment Item is created using a `config.json` and `index.html` file. The PIE Packaging Tool assembles and packages a javascript runtime for the Assessment Item.

A packaged item will have the following assets:

```
  config.json // the definition and configuration for the PIEs in the assessment item 
  index.html // placement of the PIE Custom Elements in html markup
  pie.js // assembled Javascript for rendering the UI for the Assessment Item in <pie-player/>
  controllers.js // the packaged controller code for the PIEs and item.
```

Using these assets the Item can be rendered in the browser. The controller logic can be run entirely on the client, or on the server if that is desired.


## Loading PIE Player

The PIE Player Javascript defines a Custom Element

```html
<script src="pie.js"/>
<script src="controllers.js"/>

<pie-player id="pie-player"></pie-player>

<script>

var player = document.querySelector('pie-player');

// load json data model 
var questionModel = ;//
var _pie_controllers.setModel(questionModel);

player.addEventListener('pie-player-ready', function(event){
    let player = event.target;
    player.env = env;
    player.session = session;
    player.controller = controller;
});

  // add event handlers
  player.addEventListener('pie', function(event) {
      if(e.detail.type === 'modelUpdated') {
      //... 
    } else if(e.detail.type === 'sessionChanged') {
      //... 
    }
  });
  
</script>
```


## Server-side execution of Controller Functions

For implementation of more secure environments, where the full question configuration model is not downloaded to the client (potentially including correct answers) the PIE controller code may be hosted on a server instead of the client.

To support this workflow, an alternate `controllers.js` may be used, that maps the requests to a server endpoint.

TODO - link to doc/section explaining how to do this.


## PIE Player API

TODO