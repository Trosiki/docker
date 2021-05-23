# Docker Library

On this repository I'll push my Docker configuration. It include Nginx configuration, Dockerfile and my docker-compose.yml.

The content and the distinct Dockerfiles will be order by Folders depending on the different functions of said Docker.

## Symfony5 Folder
This folder is the configuration from my Docker image in [Trosiki's Dockerhub](https://hub.docker.com/repository/docker/trosiki/trosiki/tags?page=1&ordering=last_updated).
You can use my configuration using in your *docker-compose.yml* the following image:
```yml
version: '3.0'

services:
    trosiki-symfony5:
        image: trosiki/trosiki:symfony5
```
* Symfony5
    * Dockerfile            - Dockerfile for build. You can use
    * common
        * default.conf      - [REQUIRED] Default configuration for NGINX
        * extra-conf.ini    - [OPTIONAL] **IF YOU DON'T USE THIS CONFIGURATION, YOU MUST TO DELETE DE COPY ON DOCKERFILE**. Additional configuration for NGINX
    * scripts
        * startup.sh        - [OPTIONAL] **IF YOU DON'T USE THIS CONFIGURATION, YOU MUST TO DELETE DE COPY ON DOCKERFILE**. Script for load the service of nginx
