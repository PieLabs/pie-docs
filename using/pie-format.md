# PIE Format

The PIE format is the file and module structure used by a PIE Player to render assessment items that use PIEs.

In its simplest form the file structure for a PIE assessment item is a directory with two files:

```
    index.json
    index.html
```


**index.json** - Contains the definition and configuration for the PIEs used in the item.

**index.html** - Contains the PIE Custom Element declarations, and may position them within other html.

The directory may also contain any assets that the PIE needs at runtime, such as images or media.


When an item is _compiled_ with the [PIE Packaging tool](packaging-tool.md), the following JS files will be added:

```
    index.js 
    controllers.js
```

**index.js** - Contains the JS for rendering the PIE Custom Elements defined in `index.json`, along with bundled dependencies.

**controllers.js** - Is a JS module containing the controllers for all PIEs defined in the `index.json`

### JSON Format 

The `index.json` file contains the definitions of the PIEs that are used in the assessment item.

Example:

```json
{
    "pies": [
        {
            "id": "1",
            "component": {
                 "name": "my-pie",
                 "version": "1.0.0"
            }
            ...
        },
        {
            "id": "2",
            "component": {
                "name": "my-other-pie",
                "version": "2.0.x"
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
