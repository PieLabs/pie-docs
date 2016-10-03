# PieController 

## ES5 access 
When you load the controller.js in a script tag, a var _pie_controller is created, to give you access to the controller.

 ```
   <script scr="controller.js"></script>
   <script>
     console.log(_pie_controller);
     
     //output 
     [object object] 
   </script>
   
 ```
   

## Javascript Api
 
### Methods
 
#### setConfig(json)
Set the configuration object for the pies

 ```
  _pie_controller.setConfig({
    "components":[
      {
       "id": "01",
       "pie": {
        "name" : "my-pie",
        "version" : "1.0.0"
       },
       "model": {
          //config options for the pie of type "my-pie"    
       }
      }
    ]
  })  
 ```

#### getOutcome() 
Calculate the outcome for the current session.  
**Verification needed**: What should happen, when the session does not have all the answers?

 ```
 var outcome = _pie_controller.getOutcome();
 console.log(outcome);
  
 //output
 {
  summary: { maxPoints: 7, points: 7, percentage: 100 },
  components: [
     {id: "01", score: {scaled: 1, min: 0, max:7, raw: 7}}
  ] 
 }
 ``` 
 
### Events
 
#### n/a  
  
 
 
 
