# Summary

Each PIE is an indvidual question-type or interaction that is designed to be re-used. An example of a PIE might be a multi-choice question-type, or a question-type that allows a student to make a bar chart or plot points on a graph.

To create a PIE a developer implements:

1. A [Custom Element](https://www.w3.org/TR/custom-elements/) that provides the user interface for the PIE
2. A Controller that provides the model to the UI and processes user responses to generate results/outcomes and learning activity 
3. An NPM package that allows users/systems to install and use your PIE


#### Example

This is a quick example of how these components of a PIE are defined. Each will be explained in detail in the next few sections.

**Custom Element**

A CustomElement provides the UI for a PIE and exposes an API to the PIE Player: 

```javascript
export default class MyPie extends HTMLElement {

  constructor() {
    super();
    this._model = null;
    this._session = null;
  }

  createdCallback() {
    this._rerender();
  }

  }

```

> As a best-practice the PIE Custom Element should be written in ES6 (although CommonJS modules are also supported) The PIE project provides development [tools](https://github.com/PieLabs/pie-cli) that handle transpilation and bundling. 

**Controller**

A Controller is implemented by the PIE, this provides a model for the PIE Element to use in the UI and provides logic for analyzing a response and providing an outcome.

```javascript
export function model(config, session, env) {
   // called when PIE is initialized and any time `env` (enviroment) properties change
}

export function outcome(config, session, env) {
  // called to produce an outcome from the user interaction with the pie (score, etc)
}
```

**NPM Package**

Each PIE is provided as a standard NPM package, using semver versioning.

```json
{
  "name": "my-pie",
  "version": "0.0.1",
  "main": "dist/index.js",
  "dependencies": {...},
  ...
}
``` 
