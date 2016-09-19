## Packaging

PIEs are defined as NPM packages, and also provide best-practice format for including documentation and a  demonstration of your PIE.

## NPM Package

All PIEs are made available as standard NPM packages. 

Example:

```json
{
  "name": "my-pie",
  "version": "0.0.1",
  "main": "dist/index.js",
  "dependencies": {...},
  ...
}
``` 


#### name (required)

The package `name` property will be used as the Custom Element name. Elements should be named according to W3C [rules](https://www.w3.org/TR/custom-elements/#concepts) for Custom Elements (all-lowercase, must contain a hyphen). The name of the PIE should be unique, as such we recommend using your organization name as the first part of the name, e.g. `organization-pie-name`

### version (required)

This is the [semver](semver.org) version for your PIE. The semver rules should be followed so that breaking changes will not be applied to existing questions that use your pie.

### main (required) 

This is the entry point for defining the Custom Element for your PIE. 

This file will be defined as a `.js` file and should be an ES6 module that is the entry point module for your Custom Element. (See examples in [Custom Element](custom-element.md))

> Important note: You should not bundle / pack your PIE's dependencies in this file, The PIE packaging tool [pie-p](todo) will do that on your behalf.


### dependencies
Define dependencies that need to be include with your PIE when it is run in the browser. 


## Demo and Docs

The [serve-pie] utility helps load and preview PIEs, it enforces some conventions about how a PIE is structured so that it can be easily reviewed in a consistent way.

To support this, the following files should be present in a PIE package:

```
README.md
docs/
  schema.json
  demo/
    index.html
    index.json
```

#### README.md

This markdown file should descrive and document how to use the PIE.

#### schema.json

This file should be a json schema document, describing the model for the `config` object that needs to provided by a content author to use an instance of the PIE.

#### demo/

This should contain a sample usage of the PIE using the [PIE format]().
