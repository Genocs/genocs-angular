# Genocs Angular Web Portal

This project is a web portal built using Angular. It serves as a front-end application for various functionalities and features.
The project is designed to be modular and scalable, allowing for easy integration with back-end services and APIs.

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 15.2.11.

## Table of Contents

# MsalAngularTutorial


## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

    ng serve -c local

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.


## Build for containers

Follow these steps to build, create the docker image and put it on Container Registry  

1. How to connect to Azure Docker container registry
   ``` bash
   az acr login --name <acr-name>
   ```

2. How to build, create the docker image and push it on Container Registry (Manually)
   ``` bash
   npm install
   npm run start
   docker build -t <acr-name>.azurecr.io/web.portal.local:1.0.0 -t <acr-name>.azurecr.io/web.portal.local:latest -f ./Dockerfile .

   az acr login --name <acr-name>
   docker push <acr-name>.azurecr.io/web.portal.local:1.0.0
   docker push <acr-name>.azurecr.io/web.portal.local:latest
   ```

   ``` bash
   # To build the Image locally, ready to be pushed to the docker registry
   docker build -t genocs/web.portal.local:1.0.0 -t genocs/web.portal.local:latest -f ./Dockerfile --build-arg BUILD_ENV=dev .

   docker push genocs/web.portal.local:1.0.0
   docker push genocs/web.portal.local:latest
   ```   

  there is even an option to the image locally

  ```bash
  npm install
  npm run start
  docker build -t web.portal.local . -f ./Dockerfile.local
  docker tag web.portal.local <acr-name>.azurecr.io/web.portal.local
  docker push <acr-name>.azurecr.io/web.portal.local
  ``` 

  ```bash
  # build the image with ARG BUILD_ENV set to 'local | dev | uat'
  docker build -t <acr-name>.azurecr.io/web.portal.uat:1.0.0 -t <acr-name>.azurecr.io/web.portal.uat:latest . -f ./Dockerfile --build-arg BUILD_ENV=uat

  docker push <acr-name>.azurecr.io/web.portal.uat:1.0.0
  docker push <acr-name>.azurecr.io/web.portal.uat:latest
  ```