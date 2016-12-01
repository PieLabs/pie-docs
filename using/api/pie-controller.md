# PieController 


A PieController is responsible for delegating calls to the pie controllers.  
The default controller is purely client side. It directly delegates to the controller methods provided by the PIEs used in the Assessment Item.
  
In a server based scenario the controller would delegate the calls to the backend.                   

## ES5 access 
When you load the controller.js in a script tag, a global var pie is created, which gives you access to the controller constructor.

 ```
   <script scr="controller.js"></script>
   <script>
     var config = {...}; //configuration of the pies
     var controller = new pie.Controller(config)
   </script>
   
 ```
   
## Javascript Api
Typically the client for this api is the pie-player. The methods should not be called by you directly.  
If you want to implement a server based controller, it has to implement the same methods.
      
### Constructor 
 ```
 /**
  * Create a controller
  * @param model A configuration object for the pies, eg. {pies:[ ... ]}.  
  * @param controllerMap A map from pie names to pie controllers.   
  */
  function PieController(model, controllerMap) 
 ```

##### Example

 ```
  var config = {pies:[{id:"1", pie:{name:"my-pie"}, model: {...}}]};
  player.controller = new pie.Controller(config, pie.controllerMap);
 ```
 
### Methods

#### outcome
 ```
 /**
  * Delegates to the pie controller outcome method and returns the collected results
  * @param session The session contains one session element for every pie.
  * @param env The env object is used to pass the player mode and other player 
  *     settings like language and accessibility options
  * @returns The method returns a promise with an array of the outcomes
  */
  function outcome(session, env) 
 ```

##### Example

 ```
  var session = [{id:"1", value:[]}, {id:"2", value:[]}];
  var env = {mode:"evaluate"};
  controller.outcome(session, env).then(function(outcome){
    console.log(outcome);
    
    //output 
    [{id:"1", score:{1, min:0, max:7, raw:7}}, {id:"2", score:{0.5, min:0, max:8, raw:4}}]
  })
 ```

#### model(session, env)
 ```
 /**
  * Delegates to the pie controller model method and returns the collected results
  * @param session The session contains one session element for every pie.
  * @param env The env object is used to pass the player mode and other player 
  *    settings like language and accessibility options
  * @returns The method returns a promise with an array of the models
  */
  function model(session, env) 
 ```

##### Example 

 ```
  var session = [{id:"1", value:[]}, {id:"2", value:[]}];
  var env = {mode:"gather"};
  controller.model(session, env).then(function(model){
    console.log(model);
    
    //output 
    [{id:"1", model:{...}, {id:"2", model: {...}]
  })
 ```
 

 
 
 
