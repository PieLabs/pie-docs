# Environment

The environment Object defines the current view-state for a PIE.
When this property changes it the [PIE Player](../pie-player.md) passes it to the [controller](controller.md) `model` function for a PIE and the resulting model is set as a property in the PIE Custom Element. 

```json
{
    "view": "gather" | "view" | "evaluate" | "preview",
    "role": "student" | "instructor",
    "lang": [BCP 47 language tag],
    "accessibility": {}
}
```

### Property: `view` 

The `view` property indicates which view the PIE should render. The following values may be provided:

| value    | Description                                                                                                                                                                     |
|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| gather   | The PIE should present a view that allows a response to be captured                                                                                                             |
| evaluate | The PIE should present the response in a way that provides an evaluation of the response provided by a user                                                                     |
| view     | The PIE should present a response with no inflection, and without allowing modification of the response.                                                                        |
| preview  | The PIE should present the interaction for a user who is finding questions/interactions to use. For example an instructor previewing questions before including them in a test. |


### Property: `role` 

Indicates the role of the current user viewing the PIE. 
Possible values are `instructor` and `student`

It is up to the PIE developer to determine what to do with these properties. For example a PIE might present the `evaluate` view differently to a user with role `student` or `instructor`, but may not have any difference in presentation for roles when the view is `gather`.

### Property: `lang` 

For localisation, the `lang` property informs the PIE of the primary language setting for the user. 
The values will be [BCP 47](https://www.w3.org/International/articles/language-tags/) tags like `en_US`


### Property: `accessibility` 

TODO - we have not filled out this property list yet



AmericanSignLanguage: Boolean
BrailleType: String
TDS_BT_EXN1 EBAE – Uncontracted – Nemeth Math
TDS_BT_ECN EBAE – Contracted – Nemeth Math
TDS_BT_EXT EBAE – Uncontracted – UEB Math
TDS_BT_ECT EBAE – Contracted – UEB Math
TDS_BT_UXN UEB – Uncontracted – Nemeth Math
TDS_BT_UCN UEB – Contracted – Nemeth Math
TDS_BT_UXT UEB – Uncontracted – UEB Math
TDS_BT_UCT UEB – Contracted – UEB Math
TDS_BT_G1 (legacy2) Uncontracted braille
TDS_BT_G2 (legacy) Contracted braille


ClosedCaptioning: Boolean

ColorContrast
Black on White (default)
 Reverse Contrast
 BlackOnRose
 Medium Gray on Light Gray
 Yellow on Blue

Highlight (permit / don't permit)

Mark for Review: Boolean (allowo mark for review?)

Masking: Boolean

NotePad Available: Boolean

PermissiveMode 
(Allows assistive technology software such as
screen readers, magnifiers, etc. to be run
on the computer. When disabled, only the
secure web browser is allowed to run. )


