# Custom Element

The user interface for a PIE is provided in the browser by a [Custom Element](https://www.w3.org/TR/custom-elements/).

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


### Reserved Element Properties

As a developer of a PIE, you can define the configuration model for your Custom Element and the properties it will receive. However the two properties `model` and `session` are reserved. They will be set by the `pie-player` in the client and should not be defined as part of your configuration model.

#### `model`

If you provide a controller with your PIE, then your controller will be called to set this property on your Custom Element, see [Controller](./controller.md).

The controller is passed the complete configuration defined for the assessment item, along with the user's session data, and current [Environment](./environment.md) properties.

This allows you to set the model to an appropriate state based on the current settings. For example if in the `environment` property the `view` was set to `evaluate` you would need the correct responses to a question available in your model so your Custom Element can display information about the responses. Or if the environment indicated that the current user had certain accessibility requirements, you can modify the model to support those.



#### `session`

The session model represents the state of a user's interaction with the PIE. This will be set by the PIE player when loading an assessment item. 

As with `model` the structure of this data is entirely up to the developer of the PIE that uses it.

### Custom Element Properties

If you do not provide a controller and only provide a Custom Element, your element may receive configuration data to its properties in two ways:

#### JSON configuration

config.json
```json
  ...
  models: [
    {
      "id":"1",
      "element":"my-pie",
      "fooBar": "some data"
    }
  ]
```

MyPie.js:
```javascript
class MyPie extends HTMLElement {
  set fooBar(value) {
    // == 'some data'
  }
}
```

#### Element Attributes

Values set within attributes on your Custom Element in html markup will be passed to the equivalent property name in your Custom Element class:

```html
  <my-pie pie-id="1" foo-bar="some data"></my-pie>
```


```javascript
class MyPie extends HTMLElement {
  set fooBar(value) {
    // == 'some data'
  }
}
```


### Events

A PIE should emit the following events:


### `pie.register` Event (required)

A PIE should emit this event when the Custom Element is connected in the DOM. This event is handled by the PIE Player which will then set the `model` and `session` properties on the element.


###  `pie` Event, `type: 'sessionChanged'` (optional)

When a PIE Custom Element is inialized the `pie-player` will set the `session` property (described above).

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

Custom Elements are natively supported in Chrome and are available in other browsers via a polyfill. (Firefox = In development,  and Webkit = done - Dec 2016)
