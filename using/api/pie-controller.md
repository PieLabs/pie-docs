# PieController 
A PieController is responsible for delegating calls to the pie controllers.  
The default controller is purely client side. It directly delegates to the pie controller methods.   
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
If you want to implement a server based controller, it has to implement these methods.      
 
### Methods

#### outcome
The outcome method delegates to the pie controller outcome method.

 ```
 /**
  * Delegates to the pie controller outcome method and returns the collected results
  * @param ids The pie controllers, which should be delegated to, are identified by the ids.
  * @param session The session contains one session element for every pie.
  * @param env The env object is used to pass the player mode and other player settings like language and accessibility options
  * @return The method returns a promise with an array of the outcomes
  */
  function outcome(ids, session, env) 
 ```

##### Example

 ```
  var ids = ["1", "2"];
  var session = [{id:"1", value:[]}, {id:"2", value:[]}];
  var env = {mode:"evaluate"};
  controller.outcome(ids, session, env).then(function(outcome){
    console.log(outcome);
    
    //output 
    [{id:"1", score:{1, min:0, max:7, raw:7}}, {id:"2", score:{0.5, min:0, max:8, raw:4}}]
  })
 ```

#### model(ids, session, env)
The model method delegates to the pie controller model method.

 ```
 /**
  * Delegates to the pie controller model method and returns the collected results
  * @param ids The pie controllers, which should be delegated to, are identified by the ids.
  * @param session The session contains one session element for every pie.
  * @param env The env object is used to pass the player mode and other player settings like language and accessibility options
  * @return The method returns a promise with an array of the models
  */
  function model(ids, session, env) 
 ```

##### Example 

 ```
  var ids = ["1", "2"];
  var session = [{id:"1", value:[]}, {id:"2", value:[]}];
  var env = {mode:"evaluate"};
  controller.outcome(ids, session, env).then(function(outcome){
    console.log(outcome);
    
    //output 
    [{id:"1", model:{...}, {id:"2", model: {...}]
  })
 ```
 
### Events
 
#### n/a  
  
 
 
 
