# Archimate Docker Image

Archimate Docker image for building reports in CI pipelines that run in the cloud such as Bitbucket Pipelines.
This image contains the Collaboration plugin for importing version controlled managed models.

## Enabled plugins

- coArchi – Model Collaboration for Archi

## Example

Create an HTML report for the current cloned model repository.
    
    /opt/Archi/Archi -application com.archimatetool.commandline.app -consoleLog -nosplash --modelrepository.loadModel . --html.createReport ./html
