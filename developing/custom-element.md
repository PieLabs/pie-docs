# Custom Element

The user interface for the PIE is provided in the browser by a [Custom Element](https://www.w3.org/TR/custom-elements/).

It should be defined in an ES6 module which is included as the main entry point the package (see [Packaging](packaging.md))

> The most basic definition of an Element module is an ES6 module (CommonJS is also supported).
> For information on developing and building your Custom Element module with framework support see [Using Modules](using-modules.md)


```javascript
export default class MyPie extends HTMLElement {

  constructor() {
    super();
    this._model = null;
    this._session = null;
  }

  set model(m) {
    this._model = m;
  }

  get session() {
    return this._session;
  }

  set session(s) {
    this._session = s;
  }

  connectedCallback() {
    // the pie-player will capture this event and set the model and session properties
    this.dispatchEvent(new CustomEvent('pie.register', { bubbles: true }));   
  }
}
```


The Element receives properties that are set by the PIE Player and may emit events to communicate out to the Player.


### Properties

#### `model`

The model property, if used by a PIE, will be passed any author-configured data that the instance of a PIE element needs to render the view.

The structure of this data is entirely up to the developer of the PIE that uses it. When an author or system configures an Assessment Item that uses the PIE, they will provide this data, and this will be passed to the property.

If the PIE provides a [controller](controller.md), the data defined in the config will first be passed to the controller `model()` function, along with `environment`. This allows the controller to set the `model` property with appropriate data for the current context.


#### `session`

The session model represents the state of a user's interaction with the PIE. This will be set by the PIE player.
As with `model` the structure of this data is entirely up to the developer of the PIE that uses it.


### Events

A PIE should emit the following events:


### `pie.register` Event (required)

A PIE should emit this event when the Custom Element is connected in the DOM. This event is handled by the PIE Player which will then set the `model` and `session` properties on the element.


###  `pie` Event, `type: 'sessionChanged'` (optional)

If the PIE modifies the state of a users interaction with the PIE (for example a user's choice of an option in a choice-question) it should emit a `pie` event with the detail type `sessionChanged`. The PIE Player may use this to persist session data.

```javascript
    var event = new CustomEvent('pie', {
      bubbles: true,
      detail: {
        type: 'sessionChanged', // this type indicates that the session state has been modified in the client
        component: this.tagName.toLowerCase() // the element name of the PIE is emitting the event.
      }
    });

    this.dispatchEvent(event);
```



### Brower Support

Custom Elements are natively supported in Chrome and are available in other browsers via a polyfill. (Firefox and Webkit have Custom Elements marked as in development - Sep 2016)
