# PIE Player

The [PIE Player](todo link to github) is a Javascript Library for rendering Assessment Items that use PIEs.


The PIE Player loads the question definition from the following modules and files:


```
  config.json // the definition and configuration for the PIEs in the assessment item 
  index.html // placement of the PIE Custom Elements in html markup
  elements.js // the Custom Elements for the pies, and their packaged dependencies
  controllers.js // the packaged controller code for the PIEs
```


## Loading PIE Player

TODO - discussion and demo of loading PIE Player for full client-side us and server-side.

```html
<script src="elements.js"/>
<script src="controllers.js"/>
<script src="node_modules/pie-player/player.js"/>
<script type='text/javascript'>
var options = ...;
var player = new PiePlayer('#player', options, env, session, controllers);

</script>

```


## Server-side execution of Controller Functions

For implementation of more secure environments, where the full question configuration model is not downloaded to the client (potentially including correct answers) the PIE controller code may be hosted on a server instead of the client.


## PIE Player API


### Callbacks

```javascript
function onSessionChanged();
```

```