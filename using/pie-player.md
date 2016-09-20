# PIE Player

The [PIE Player](todo link to github) is a Javascript Library for rendering Assessment Items that use PIEs.



As described in the [previous section](defining-questions.md) the PIE Player loads the question definition from the following modules and files:


```
  config.json // the definition and configuration for the PIEs in the assessment item 
  index.html // placement of the PIE Custom Elements in html markup
  elements.js // the packaged code and dependencies for the PIEs
  controllers.js // the packaged controller code for the PIEs
```


## Loading PIE Player

TODO - discussion and demo of loading PIE Player for full client-side us and server-side.


## PIE Player API


### Callbacks

```javascript
function onSessionChanged();
```

```