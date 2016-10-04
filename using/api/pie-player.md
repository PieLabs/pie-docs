# pie-player 
**Verification needed:** The pie-player element is generated from the html fragment and some javascript. The html fragment, which declares the pies and some optional html, is internal to it. 

## Html
### Custom Element <pie-player>  
This element renders the pies.      
It serves as the main access object for the api described below.
 
 ```
  <pie-player id="my-player"></pie-player>
 ```
    
## Javascript Api
 
### Methods 

#### Setter env 
The player view mode can be set via the env.
 
 ```
 player.env = {mode:'gather'}
 ```
  
#### Setter session
The various user inputs are collected in this object.   
The pies can use the session to store session related data like the order of options for example.
     
 ```
  player.session = {value:[]}
 ```

#### Getter session 
**Verification needed:** Do we want/need a getter on this level? The session object is saved internally by the controller. If we want to be able to access the updated session, can the event hold it?   


#### Setter controller
The controller is used by the player to calculate model changes and outcomes.
 
 ```
  var config = ... //load json
  var controller = new pie.Controller(config); 
  player.controller = controller;
 ```
 
#### completeResponse() 
Mark a session as complete.   
**Verification needed:** Does it dispatch a response-change event?   
**Verification needed:** Can a session be complete, if it doesn't have all the answers?   

 ```
   player.completeResponse().then(function(){
      var isComplete = player.isComplete();
      console.log(isComplete) 
   });
    
   //output 
   true
 ```
 
#### getOutcome() 
Calculate the outcome for the current session.  
**Verification needed**: What should happen, when the session does not have all the answers?   

 ```
 player.getOutcome().then(function(outcome){
    console.log(outcome);
 });
  
 //output
 {
  summary: { maxPoints: 7, points: 7, percentage: 100 },
  components: [
     {id: "01", score: {scaled: 1, min: 0, max:7, raw: 7}}
  ] 
 }
 ``` 
 

#### getSessionStatus()
Returns the following information about the responses: 
  
1. allInteractionsHaveResponse: Boolean 
2. interactionCount: Number
3. interactionsWithResponseCount: Number

**Verification needed:** Should it contain the session too?    
**Verification needed:** Should it contain the value of isComplete?    
 
 ```
    player.getSessionStatus().then(function(sessionStatus){
      console.log(sessionStatus);
    });
     
    //output
    {
     allInteractionsHaveResponse: true,
     interactionCount: 7,
     interactionsWithResponseCount: 7
    }
      
  ```

#### isComplete() 
**Verification needed:** Can a session be completed by answering all questions? Or is this reporting truem only when completeResponse has been called?   

  ```
    player.isComplete().then(function(icComplete){
      console.log(isComplete);
    })
    
    //output
    false 
  ```

#### reset() 
Reset the session, as if it is loaded for the first time.    
This includes everything stored in the session, also stashed orders.    

  ```
    player.reset()
  ```

        
#### resetResponse()  
Reset all the changes a user has done to the interactions.   
This is different from player.reset() in that it doesn't reset other things, that have been stored in the session, eg. a random order of multiple choice options    
        
  ```
    player.resetResponse()
  ```
 
### Events 

#### pie-player-ready (bubbles=true) 
This event is dispatched, when the api of a pie-player is ready to be used.   
    
 ```
 document.addEventListener('pie-player-ready', function(){
    var player = event.target;
    player.env = env;
    player.session = session;
    player.controller = controller;
    player.addEventListener(...)
 });
 ```

#### response-change (bubbles=true)
The event is dispatched, whenever the status of the current response has changed, eg. when a question is loaded, when the user interacts with a question, when a session is reset.
The event.detail contains a sessionStatus object    

 ```
  player.addEventListener('response-change', function(evt){
     console.log(evt.detail.sessionStatus); 
     
     //output
     {
       allInteractionsHaveResponse: false,
       interactionCount: 7,
       interactionsWithResponseCount: 3
     }
  });
  ```
   

