# Rendering Questions

The PIE [Packaging Tool](packaging-questions.md) is used to assemble and package the Javascript and HTML into files needed to render an Assessment Item in the browser.

The command uses 2 input files: 

| File              | Description                                                        | 
|-------------------|--------------------------------------------------------------------|
| config.json       | JSON data that defines the questions & interaction PIEs in an item | 
| index.html        | Markup defining the layout of the pies inside a pie-player         |


It generates the following files: 

| File              | Description                                                        | usecase   |
|-------------------|--------------------------------------------------------------------|-----------|
| pie.js            | Single file containing everything needed to render the item        | simple    |
| pie-view.js       | Assembled Javascript for rendering the UI for the Assessment Item  | advanced  |
| pie-controller.js | Packaged controller code for the PIEs defined in the config        | advanced  |

We have 2 usecases above. `simple` is the most convenient but lacks reusability, `advanced` requires more effort to use but allows for reusability. See below for more information on reuse.

# simple - pie.js 

`pie.js` is the file to use to render the item as simply as possible: 

```html
<div id="player-holder"></div>
<script src="pie.js" type="text/javascript"></script>
<script type="text/javascript">
  env = {mode: 'gather'};
  session = [];
  var player = pie.bootstrapPlayer('#player-holder', env, session);
</script>
```

## pros
* simple to use
* only need to load 1 file

## cons 
* controller and model run in the browser - not secure
* markup is baked into the js
* config is baked into the js 
* not reuasable - specific to the item


# advanced 

`pie-view.js` and `pie-controller.js` are the files to use if you want more control over the rendering.

## client-side

The example below renders a single `pie-player` with a client side controller.

```html 
<script src="pie-view.js"></script>
<script src="pie-controller.js"></script>
<!-- we declare a `pie-player` and within that tag is the markup from `index.html` -->
<pie-player>
  <my-pie pie-id="1"></my-pie>
</pie-player>
<script type="text/javascript">
  env = {mode: 'view'};
  session = [];
  function loadJson(path){
    return new Promise((function(resolve, reject){
      //load the json here ...
    }));
  }
  /** listen for the `pie.player-ready` event */  
  document.addEventListener('pie.player-ready', function(event){
    loadJson('config.json').then(config => {
      var player = event.target;
      player.env = env;
      player.session = session;
      /** 
       * instantiate a PieController and assign it to the `pie-player`. 
       * `pie.controllerMap` is where to find the controller map logic.
       */
      player.controller = new pie.PieController(config, pie.controllerMap);
    }).catch(e => throw e);
  });
</script>

```

### pros 

* better control over initialisation
* `pie-view.js` and `pie-controller.js` are reusable outside of the item.

### cons 

* controller and model run in the browser - not secure
* 2 files to load 
* more logic needed to render the player  

## server-side 

The example below renders a single `pie-player` with a remote controller.

```html 
<script src="pie-view.js"></script>
<script src="pie-remote-controller.js"></script>
<!-- we declare a `pie-player` and within that tag is the markup from `index.html` -->
<pie-player>
  <my-pie pie-id="1"></my-pie>
</pie-player>
<script type="text/javascript">
  env = {mode: 'view'};
  session = [];

  endpoints: {
    model: {
      method: 'POST',
      url: '/model'
    },
    outcome: {
      method: 'POST',
      url: '/outcome'
    }
  }

  function loadJson(path){
    return new Promise((function(resolve, reject){
      //load the json here ...
    }));
  }
  /** listen for the `pie.player-ready` event */  
  document.addEventListener('pie.player-ready', function(event){
    loadJson('config.json').then(config => {
      var player = event.target;
      player.env = env;
      player.session = session;
      /** 
       * instantiate a PieController and assign it to the `pie-player`. 
       * `pie.controllerMap` is where to find the controller map logic.
       */
      player.controller = new PieRemoteController(endpoints);
    }).catch(e => throw e);
  });
</script>
```
Below is a possible server implementation running as a commonjs node module:

```javascript
const http = require('http');
const pie = require('./pie-controller');
const config = JSON.parse(fs.readFileSync('./config.json'));
const controller = new pie.PieController(config, pie.controllerMap);

let handleError = (res) => {
  return (err) => {
    res.writeHead(500, {'Content-Type' : 'text/plain'});
    res.write(err.toString());
    res.end();
  }
}

server = http.createServer((req, res) => {

  if(req.url === '/model' && req.method === 'POST'){

    //parse session + env from the request body ...
    controller.model(config, session, env)
      .then(model => {
        res.writeHead(200, {'Content-Type' : 'application/json'});
        res.write(JSON.stringify(model));
        res.end();
      }).catch(handleError(res))
  } else if (req.url = '/outcome' && req.method === 'POST'){
    //parse session + env from the request body ...
    controller.outcome(config, session, env)
      .then(outcome => {
        res.writeHead(200, {'Content-Type' : 'application/json'});
        res.write(JSON.stringify(outcome));
        res.end();
      }).catch(handleError(res))
  } else {
    res.writeHead(404)
    res.write('');
    res.end();
  }
}

server.on('listening', () => console.log('server listening...'));
server.listen(process.env.PORT || 5001);

```

### pros 

* better control over initialisation
* secure - controller and config are run on the server away from the browser

### cons

* requires a server to run the controller logic.

# Reuse 

When you pack a question there are 2 files generated that are reusable. This is because they contain logic only related to the `pies` used by the question. They don't contain any logic relating to the question itself. 

Say we have 1 question that has: 

```javascript
{ 
  pies: [
    { 
      pie: { 
        name: 'my-pie', 
        version: '1.0.0'
      }, 
      prompt: 'question 1'
    }
  ]
}
```
And another like so: 
```javascript
{ 
  pies: [
    { 
      pie: { 
        name: 'my-pie', 
        version: '1.0.0'
      }, 
      prompt: 'question 2.a'
    },
    { 
      pie: { 
        name: 'my-pie', 
        version: '1.0.0'
      }, 
      prompt: 'question 2.b'
    }
  ]
}
```

Both these questions use `my-pie@1.0.0`, so the `pie-view.js` + `pie-controller.js` built for question 1 would work for question 2. Because the generation of these files is an intensive task it would be better if you could skip the generation if you already have built the source and so can *reuse* it.

To assist with reuse, `pack-question` will also generate a manifest alongside `pie-view.js` and `pie-controller.js`. The manifest will describe exactly what versions of each pie have been bundled. Using this manifest you can decide whether or not you need to run a build or not.

* TODO: fleshout manifest format + api?
