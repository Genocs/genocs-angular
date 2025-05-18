# A Dockerfile for building and running an Angular application with Nginx

FROM node:22 AS build

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Install Angular CLI at version 15
RUN npm i -g @angular/cli@15

# RUN npm install to install all packages
RUN npm install

COPY . .

# Set Arguement for the environment with default value of dev
ARG BUILD_ENV=dev

# Build the app in dev mode. Remember to add a parameter to the dockerfile to build in production mode
RUN npm run build -c ${BUILD_ENV}

# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source

FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
WORKDIR /usr/share/nginx/html
COPY --from=build /usr/src/app/dist/. .

EXPOSE 80