# Example

In this example, we will use a sample assessment item to package and view an item using the PIE CLI.

To use the example, first download these item definition files and save them in a directory on your system.

> [config.json](demo-item/config.json)

> [index.html](demo-item/index.html)


## Getting Started

To package and view the example assessment item we will use the PIE CLI toolkit, this can be installed by using the following command in a terminal window.

```shell
npm install pie
```

> `npm` is included as part of the Node.js system. To use the command above you should first download and install node: https://nodejs.org/en/download/


## Packaging and Viewing the Example

In a terminal, cd into the directory in which you downloaded the sample files above. Then run the following command:

```pie pack --buildExample```

This will generate the javascript code needed to render the assessment item.

It will also build a sample html file for loading the item in a browser.

To view the item, you can then run the command:

```pie serve```

This will launch a server and you will be able to view the assessment item by opening the url:

`http://localhost:4000`



