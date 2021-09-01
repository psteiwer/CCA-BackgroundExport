# CCA-BackgroundExport
## Custom Cube Action - Background Export

This custom action adds the ability to export to Excel and PDF in the background. Exporting in the background can be beneficial if the export may take an extended amount of time to execute. Files will be exported on the server to the default directory for the namespace.

## Installation
Import "CustomCubeActions.Actions.BackgroundExport.Methods.cls".
Optionally import "CustomCubeActions.Actions.BackgroundExport.ActionClass.cls" if Action Class is needed.
### No Action Class Defined
If you are installing this for a cube that does not have an action class defined, "CustomCubeActions.Actions.BackgroundExport.ActionClass.cls" can be used an an action class. After importing, simply configure your cube with actionClass="CustomCubeActions.Actions.BackgroundExport.ActionClass"
### Action Class Already Defined
If you already have an action class defined, you can modify your existing class to include calls to CustomCubeActions.Actions.BackgroundExport.Methods.cls
