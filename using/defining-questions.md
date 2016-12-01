# Defining Questions

Using PIEs, an author can define an Assessment Item, which is one or more questions, interactions, and UI elements that can be presented to a user in a browser. 

A simple example could be a single Multi-Choice question with text prompt and choices. A more advanced example might include more than one question or interaction type, and include content like text passages, video,  or charts.

To define an Assessment Item a user (or authoring system) creates a JSON and HTML file: 


- **config.json** - Contains the definition and configuration for the PIEs used in the item.
- **index.html** - Contains the PIE Custom Element declarations, and may position them within other html.

These files are placed in a directory structure which may also contain any assets that the PIE needs at runtime such as images or media.


```
    config.json
    index.html
    picture-one.png
```

> For development purposes, a `depencencies.json` file may be also be added to the directory. This is described below.

### Config JSON

The `config.json` file defines the configuration for the Assessment Item and for the PIEs in the Item. For example a configuration for a mult-choice PIE question would include the choices, and the correct responses. 

The JSON definition contains the following properties:


#### player (optional)

```json
   "player": {"pie-player": "^1.0.0"}
```

This defines the PIE Player npm package to use for rendering the item.
If this property is not defined, the latest version of `pie-player` will be used by the packaging tool when assessment item.

[Semver](http://semver.org) versioning is used. 


#### `elements` (required)

The `elements` object defined all the PIEs that are used in the Assessment Item.

Each property in the `elements` object defines the Element name, and the value defines the version of the Element.

> versions are defined using [semver](http://semver.org) syntax

```json
{
    "elements" : {
        "my-pie-element": "1.0.0",
        "another-element": "1.0.0" 
    }
}
```

#### `models` (required)

An array of Objects providing configuration data for Interaction Elements in the Assessment Item.

Each of these Objects contains the following required properties:


##### `id` (required)

Unique id (within the definition) for the defined PIE

##### `element` (required)

This is the Element name/type. 
The element and version must be defined in the `elements` property (see above)


```json
    "models": [
        {
            "id": "1",
            "element":"my-multi-choice-pie",
            "choices": ["apple", "orange", "banana", "cucumber", "pea"],
            "correctChoices": ["cucumber", "pea" ],
            {
                //other configuration for the PIE
            }
        },

        {
            "id": "2",
            "pie": {
                "name": "my-other-pie",
                "version": "2.0.1"
            },
            {
                //other configuration for the PIE
            }
        }
    ]
```



#### `weights` (optional)

This Object is optional, it defines the score weighting for each PIE included in the definition.
A calculated score for the assessment item will take these weights into account.

```json
    "weights": [
        {
            "id":"1", // unique identifier for the PIE (within the definition)
            "weight": "2" // relative weight to be given to the scaled score for this PIE when calculating overall score
            }
    ]
```



#### Example:

`config.json`
```json
{
    "player": {"pie-player": "~1.0.1"},
    "elements": {
        "my-multi-choice-pie": "^1.0.0",
        "my-other-pie": "2.0.1"  
    }
    "models": [
        {
            "id": "1",
            "element": "my-multi-choice-pie"
            "pie": {
                    "name": "my-multi-choice-pie",
                    "version": "^1.0.0"
            },
            "choices": ["apple", "orange", "banana", "cucumber", "pea"],
            "correctChoices": ["cucumber", "pea" ],
            {
                //other configuration for the PIE
            }
        },
        {
            "id": "2",
            "element": "my-other-pie",
            {
                //other configuration for the PIE
            }
        }
    ]
    "weights": [
        {"id":"1", "weight": "2"},
        {"id":"2", "weight": "1"}
    ],
    "langs": ["en_US", "es_ES", "zh_CN"]
}
```


> Each PIE defines and documents the JSON model needed for that question/interaction type. In typical usage an authoring tool will be used to create the question definitions.



#### HTML

The HTML file defines the placement of the PIEs within HTML markup.

The `id` attribute in the html references the `id` of the PIE defined in the JSON.

Example:

`index.html`
```html
Here is question one:
<my-pie id="1"></my-pie>
<p/>
Here is question two:
<my-other-pie id="2"></my-other-pie>
```

### dependencies.json

The PIEs defined in `config.json` are downloaded and packaged as NPM libraries. If for development purposes you wich to load these PIEs from a local directory or from a git url you can add a `dependencies.json` file. This file accepts NPM style URIs for pacakges.

example: dependencies.json
```json
    {
    "corespring-multiple-choice" : "../.."
    }
```