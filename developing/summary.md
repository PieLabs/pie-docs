# Summary

Each PIE is an indvidual question-type or interaction that is designed to be re-used.

To create a PIE a developer implements:

1. A [Custom Element](https://www.w3.org/TR/custom-elements/) that provides the user interface for the PIE
2. A Controller that provides the model to the UI and processes user responses to generate results/outcomes and learning activity 
3. An NPM package that allows users/systems to install and use your PIE

See the developer [tools](tools.md) to help bootstrap PIE development.

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

**Controller**

A Controller is implemented by the PIE, this provides a model for the PIE Element to use in the UI and provides logic for analyzin a response and providing an outcome.

```javascript
export function model(question, session, env) {
  ...
}

export function outcome(question, session, env) {
  ...
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
