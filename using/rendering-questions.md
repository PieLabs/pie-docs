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

> ED: 1. Does this unique id relate to what we were talking about in terms of enabling re-usability? If so the uid has a relationship with the permutation of pie names+versions used within the config/markup. It doesn't have any direct relationship with the item itself. 2. what do you maen about naming a directory? I thought we were going to output to the target directory and generate some form of manifest with any uid/build info in it.


## Simple Usage - Client Side Only

The simplest way to load a PIE-formatted item is to use the `pie.js` file. This file includes everything needed to render the item in a user's browser. 

> ED: Explain a bit more what we mean by client side only?

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
> ED: In the sample above you're not setting the session, but I don't think the logic in `pie.js` should be setting the session either, this array is something that the end-user(dev) will want to inject.

For complete documentation on interacting with the `pie-player` element, see the [PIE Player API](api/pie-player.md)


## Advanced Usage, Server-Side Usage

> ED: Advanced usage isn't the same as server side usage. It just means that you have finer grained control, but you can still do a client side only option if you want, so I'd have 2 examples here + explain what's happening.

If you want finer control over how to use the PIE-formatted item, or want to use the Assessment Item in a secure-testing environment where data, including correct-responses, is not sent to the client you can use the other files in a packaged item:


TODO




