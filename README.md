# Archimate Docker Image

Archimate Docker image for building reports in CI pipelines that run in the cloud such as Bitbucket Pipelines.

## Example

Create an HTML report for the current cloned model repository.
    
    ./Archi -application com.archimatetool.commandline.app -consoleLog -nosplash --modelrepository.loadModel . --html.createReport ./html
