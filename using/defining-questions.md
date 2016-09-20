# Defining Questions

Each PIE is a re-usable question/interaction-type.

To define a question or interaction that uses one or more PIEs a user or authoring system creates a JSON and HTML file: 


- **index.json** - Contains the definition and configuration for the PIEs used in the item.
- **index.html** - Contains the PIE Custom Element declarations, and may position them within other html.

To define the question these files are put in a directory which may also contain any assets that the PIE needs at runtime such as images or media.


```
    index.json
    index.html
    picture-one.png
```

#### JSON

The JSON definition contains an array of objects in the property `pies`.
Each of these objects contains the following required properties:

##### id 

Unique id (within the definition) for the defined PIE

##### pie

The pie object contains the following properties:

- name : the name of the pie (this is the same as the NPM name, and is used for the Custom Element in HTML)
- version: the [semver](http://semver.org) version of the PIE to use in this package.

Example:

`index.json`
```json
{
    "pies": [
        {
            "id": "1",
            "pie": {
                 "name": "my-multi-choice-pie",
                 "version": "^1.0.0"
            },
            choices: ["apple", "orange", "banana", "cucumber", "pea"],
            correctChoices: ["cucumber", "pea" ],
            ...
        },
        {
            "id": "2",
            "pie": {
                "name": "my-other-pie",
                "version": "2.0.1"
            }
            ...
        }
    ],
    "weight": {
        "1":2,
        "2":1
    }
}
```


> Each PIE defines and documents the JSON model needed for that question/interaction type. In typical usage an authoring tool will be used to create the question definitions.


#### HTML

The HTML file defines the placement of the PIEs within HTML markup.

Example:

`index.html`
```html
Here is question one:
<my-pie id="1"></my-pie>
<p/>
Here is question two:
<my-other-pie id="2"></my-other-pie>
```



### Packaging a Question

The `index.json` and `index.html` files, along with other assets such as media make up the basic definition of a question or set of questions that use PIEs.

For this to be presented in a browser using the [PIE Player](pie-player.md) the Javascript code for rendering the PIE Custom Element and Controller logic needs to be assembled.

When an item is _packaged_ with the [PIE Packaging tool](packaging-tool.md) the following JS files will be added to the directory:


- **index.js** - Contains the JS for rendering the PIE Custom Elements defined in `index.json`, along with bundled dependencies.

- **controllers.js** - Is a JS module containing the controllers for all PIEs defined in the `index.json`



