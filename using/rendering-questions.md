# Rendering Questions

The PIE Packaging Tool assembles and packages a javascript runtime for the Assessment Item.

In addition to the base definition files (`config.json` and `index.html`) a packaged item will have the following files:

```
  pie.js // assembled Javascript for rendering the UI for the Assessment Item in <pie-player/>
  pie-controllers.js // the packaged controller code and config for the PIEs and Assessment Item.
```

Using these assets the Item can be rendered in a browser. The controller logic can be run entirely on the client or on a server system.


## Loading PIE Player

The PIE Player Javascript defines a Custom Element `pie-player` this can be added to an HTML page to render the assessment item.

To configure the player the `config` json and `env` properties are set. If loading an existing user session, the `session` property could be loaded and set.

The following example shows how to load the player using client-side controller.  


```html

<pie-player id="pie-player"></pie-player>

<!-- all the code and html for rendering the assessment item is bundled in pie.js -->
<script src="pie.js" type="text/javascript"></script>
<!-- pie-controller.js includes the configuration and controller methods -->
<script src="pie-controller.js" type="text/javascript"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function(){
  // see documentation on Environment for configuring this
  environment = {view: 'gather'};
  var player = document.querySelector('pie-player');
  player.addEventListener('pie-player-ready', function(event){
    player.controller = new pie.Controller();
    player.env = environment;
  });
  player.addEventListener('response-change', function(evt){
    // triggered when a user modifies their response
  });
});

</script>

```


### Server-side execution of Controller Functions

Short example of using controllers hosted on a server. See [documentation](server-side-controller.md) for complete explanation.


```
<pie-player id="pie-player"></pie-player>
<!-- all the code and html for rendering the assessment item is bundled in pie.js -->
<script src="pie.js" type="text/javascript"></script>
<!-- using utility library to map controller calls to a server - see full documentation on server-side controllers -->
<script src="/node_modules/pie-remote-controller/pie-remote-controller.js" type="text/javascript"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function(){
  env = {view: 'gather'};
  session = [];  
  var player = document.querySelector('pie-player');
  player.addEventListener('pie-player-ready', function(event){
    var route = "/my/server/items/:itemId/";
    player.controller = new pie.RemoteController(route);
    player.env = env;
    player.session = session;
  });
});	
```


## PIE Player API