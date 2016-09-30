# Defining Questions

Each PIE is a re-usable question/interaction-type.

An Assessment Item is one or more PIE interactions configured by a content author to present questions or interactions to a student.

To define an Assesment Item using one or more PIEs a user (or authoring system) creates a JSON and HTML file: 


- **config.json** - Contains the definition and configuration for the PIEs used in the item.
- **index.html** - Contains the PIE Custom Element declarations, and may position them within other html.

These files are placed in a directory structure which may also contain any assets that the PIE needs at runtime such as images or media.


```
    config.json
    index.html
    picture-one.png
```

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


#### `pies` (required)

An array of Objects specifying and configuring each PIE in the Assessment Item.

Each of these Objects contains the following required properties:


##### `id` (required)

Unique id (within the definition) for the defined PIE

##### `pie` (required)

The pie Object contains the following properties:

- name : the name of the pie (this is the same as the NPM name, and is used for the Custom Element in HTML)
- version: the [semver](http://semver.org) version of the PIE to use in this package.

```json
    "pies": [
        {
            "id": "1",
            "pie": {
                 "name": "my-multi-choice-pie",
                 "version": "^1.0.0"
            },
            "choices": ["apple", "orange", "banana", "cucumber", "pea"],
            "correctChoices": ["cucumber", "pea" ],
            {//other configuration for the PIE}
        },

        {
            "id": "2",
            "pie": {
                "name": "my-other-pie",
                "version": "2.0.1"
            },
            {//other configuration for the PIE}
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

#### `langs` (optional)

Defines the translations that are available for the item. 
The pie-player provides an api to look up which languages are supported, the langauge to use is set by using the `lang` property in the `env` object passed to the PIEs.

```json
  "langs": ["en_US", "es_ES", "zh_CN"]
```

#### Example:

`config.json`
```json
{
    "player": {"pie-player": "~1.0.1"},
      "pies": [
        {
            "id": "1",
            "pie": {
                 "name": "my-multi-choice-pie",
                 "version": "^1.0.0"
            },
            "choices": ["apple", "orange", "banana", "cucumber", "pea"],
            "correctChoices": ["cucumber", "pea" ],
            {//other configuration for the PIE}
        },

        {
            "id": "2",
            "pie": {
                "name": "my-other-pie",
                "version": "2.0.1"
            },
            {//other configuration for the PIE}
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

