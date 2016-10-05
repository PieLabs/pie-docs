# Packaging Questions


The `config.json` and `index.html` files, along with other assets such as media files make up the definition of an Assessment Item (one or more questions and interactions that use PIEs).

For this Item to be presented in a browser the Javascript code for rendering the PIE Custom Elements and Controller logic needs to be assembled.

The [PIE CLI](https://github.com/PieLabs/pie-cli) provides a packaging tool that will package and assemble the PIE code and all dependencies and wrap them in a PIE Player for rendering. 

> pie package [item directory]

When an Assessment Item is packaged the packaging tool adds the following javascript files to the item definition: `pie.js` and `pie-controller.js`




#### `pie.js`

This file contains the javascript for rendering the PIE Custom Elements defined in `config.json` and `index.html`, along with bundled and optimized dependencies. 

The script defines a `<pie-player>` Custom Element which will load the Assessment Item in HTML.


#### `pie-controller.js`

This script provides access to the configuration and controllers for the PIE Assessment Item. 
It can be loaded directly in the browser, or hosted in a server environment*



### Distributing Questions

When sharing PIE Assessment Items between systems, the best practice is to share them in their packaged form (including the basic definition and assets along with the assembled javascript code). The system receiving the items may choose to re-package if necessary using the basic item definition.


Example:
```
  config.json
  index.html
  pie.js
  pie-controller.js
  picture-one.png
  ...
```


> Extra metadata that may (and should) be included with an Assessment Item is currently outside the scope of the PIE project.



