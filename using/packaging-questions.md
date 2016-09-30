# Packaging Questions


The `config.json` and `index.html` files, along with other assets such as media files make up the basic definition of an Assessment Item (one or more questions and interactions that use PIEs).

For this Item to be presented in a browser the Javascript code for rendering the PIE Custom Elements and Controller logic needs to be assembled.

The PIE project provides a [PIE Packaging tool](TODO-LINK) that will package and assemble the PIE code and all dependencies and wrap them in a PIE Player for rendering. 

>pie package [item directory]

When an Assessment Item is packaged the packaging tool adds the following javascript files to the item definition: `pie.js` and `controllers.js`




#### `pie.js`

This contains the javascript for rendering the PIE Custom Elements defined in `config.json` and `index.html`, along with bundled and optimized dependencies. 

The script defines a `<pie-player>` Custom Element which will load the Assessment Item in HTML.


#### `controllers.js`

This script provides access to the Controllers for PIEs (each indexed with its defined name)  and  other methods for working with sets of PIEs 

> See the [next section](pie-player.md) for how to use these assembled items in your system.

### Distributing Items

When sharing Items between systems it is recommended that they be shared in their packaged form (including the basic definition and assets along with the assembled javascript code). The system receiving the items may choose to re-package if neccesary using the basic item definition.

Extra metadata that may (and should) be included with an Item is outside the scope of the PIE project itself.



