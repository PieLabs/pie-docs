## Setting up your first PIE

To start creating a custom PIE, the first step is to create a directory and initialize the project. For the purposes of this explanation, we'll be developing a simple toggle with a value of either `true` or `false`.

    mkdir pie-toggle
    cd pie-toggle
    npm init

Using the interactive `npm` command, set the name of the interaction to `pie-toggle`, and set the "entry point" to `src/index.js`. Afterwards, there should be a `package.json` file in the directory which looks like this:

    {
      "name": "pie-toggle",
      "version": "1.0.0",
      "description": "",
      "main": "src/index.js",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "author": "",
      "license": "ISC"
    }

It would also be useful to set up a README at this point:

    touch README.md