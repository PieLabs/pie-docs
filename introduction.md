# PIE: Portable Interaction Elements

> DRAFT: the PIE Framework is currently in pre-release, information in these documents is subject to change

Portable Interaction Elements \(PIE\) is an Open Source framework for building re-usable interactions and questions that can capture a user's response, analyze a user's response, and report an outcome and learning activity from the user interaction.

It supports the development of highly interactive questions and assessment interactions that can be shared and distributed to run on any web-based platform, fully preserving their design and functionality.


### What is it For?

Currently, it is quite difficult to author assessment questions that:

- Look and behave in the same way as the author intended, regardless of which system they are used in 
- Support more advanced interactions that are engaging and effective for assessing knowledge
- Are simple to share between authors and learning systems while preserving support for the above 2 goals
- Use more advanced scoring algorithms


The PIE framework addresses this problem by providing:

- A framework and tools for developing re-usable assessment interactions (Portable Interaction Elements - PIEs)
- An Open Source Player, for rendering assessments that use PIEs
- An Open Source format and tools, for sharing assessments in a 'binary' format that preserves the exact behaviour and design of the assessment item.


### How Does it Work?

The PIE framework takes the approach that web-standards should be adopted wherever possible, and web development best practices should be used to make development as simple as possible.

In Summary, the PIE Framework:

- uses [Custom Elements](https://www.w3.org/TR/custom-elements/) to define re-usable UI Elements
- uses JSON data to configure questions/interactions
- uses NPM for the definition of PIEs and for dependency resolution
- uses module bundling and packing techniques to create optimized shareable 'binary' bundles for rendering items


### Does it Support Standards?

PIE itself is not a standard, it is an Open Source implementation designed to provide an immediate solution to an existing problem. It provides tools for developing, packaging and rendering Assessment Items that use PIE interactions. Interactions that are developed and packaged using the tools provided in this framework will render correctly - on any modern web system.

We have great respect for the standards process and standards bodies in the education field. If at some time the format specifications used by this technology may make sense to be adopted as a standard we would welcome such a development.

##### Caliper / Tin Can / CMI5
PIE supports exporting activity events during the lifecycle of user interaction with PIEs. Support for IMS Caliper/ ADLnet Tin Can/CMI5 is possible using this model.

##### IMS LTI
PIE is just a system for rendering the interactions and questions, and as such can be wrapped in any page that may use an LTI Launch. Similarly, outcomes from user interaction could be returned through LTI outcomes.

##### IMS QTI
PIE Format does not replace QTI 2, but QTI items can be converted into PIE format and 'compiled' and as such can be distributed with the full visual rendering and behavior included. 

### What is the Origin of PIE?

The PIE Framework is based on several years of work by CoreSpring.org in the field of building authoring and rendering tools for assessment interactions.

We developed this technology to help fulfill our philanthropic mission of making high-quality, inexpensive & free assessment content available to educators.

We believe this challenge of creating and sharing assessment items with advanced interactions with high fidelity is shared across the education industry. We decided to make our solution to this problem available as an Open Source project in the hope that it will ultimately help educators have better access to high-quality and more interactive assessment interactions.
