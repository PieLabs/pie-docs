# Rendering Questions

The PIE [Packaging Tool](packaging-questions.md) is used to assemble and package the Javascript and HTML into files needed to render an Assessment Item in the browser.

An Assessment Item packed by the Packaging Tool may have some or all of the following files:

| File              | Description                                                        |
|-------------------|--------------------------------------------------------------------|
| pie.js            | Single file containing all code and config to render the item      |
| config.json       | JSON data that defines the questions & interaction PIEs in an item |
| index.html        | Markup for adding the PIEs to html document                        |
| pie-view.js       | Assembled Javascript for rendering the UI for the Assessment Item  |
| pie-controller.js | Packaged controller code for the PIEs defined in the config        |


> By convention, these files will be contained in a directory named with a unique id for the assessment item.

## Simple Usage - Client Side Only

The simplest way to load a PIE-formatted item is to use the `pie.js` file. This file includes everything needed to render the item in a user's browser. 

Example:
```html

<!-- all the configuration, javascript and html for rendering the assessment item is bundled in pie-all.js -->
<script src="pie.js" type="text/javascript"></script>

<pie-player id="pie-player"></pie-player>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function(){
  // see documentation on Environment for configuring this
  environment = {view: 'gather'};
  var player = document.querySelector('pie-player');
  player.addEventListener('pie.player-ready', function(event){
    player.env = environment;
  });
  // Add an event to be notified when a user has modified their response 
  player.addEventListener('response-change', function(evt){
    
  });
});

</script>

```

For complete documentation on interacting with the `pie-player` element, see the [PIE Player API](api/pie-player.md)


## Advanced Usage, Server-Side Usage

If you want finer control over how to use the PIE-formatted item, or want to use the Assessment Item in a secure-testing environment where data, including correct-responses, is not sent to the client you can use the other files in a packaged item:


TODO




