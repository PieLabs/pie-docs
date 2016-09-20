# Packaging Questions

The `config.json` and `index.html` files, along with other assets such as media make up the basic definition of a question or set of questions that use PIEs.

For this to be presented in a browser using the [PIE Player](pie-player.md) the Javascript code for rendering the PIE Custom Element and Controller logic needs to be assembled.

The [PIE Packaging tool](packaging-tool.md) will package and assemble the PIE code and its dependencies. When packaged, it adds the following javascript files to the item definition: `elements.js` and `controllers.js`


#### `elements.js`

This contains the JS for rendering the PIE Custom Elements defined in `config.json`, along with bundled dependencies.
This script will register the PIE Custom Element in the document `document.registerElement('my-pie');`

#### `controllers.js`

This script provides an object with a map containing the Controller for each PIE indexed with its defined name.

This script can be loaded in the client with a `<script src="">` tag, or as a javascript module for server-side use.

It declares the object `pie_controllers` as a var in global scope for use when loaded as a script. 

It can also be imported as a module:

Example (ES6):

```javascript
import PieControllers from "controllers"`
PieControllers['my-pie'].model(config, session, env)
```

