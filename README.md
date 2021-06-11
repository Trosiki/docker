# Docker Library

On this repository I'll push my Docker configuration. It include Nginx configuration, Dockerfile and my docker-compose.yml.

The content and the distinct Dockerfiles will be order by Folders depending on the different functions of said Docker.
## Using docker-compose.yml
With docker-compose.yml we can initialize our containers. Depending of our requirements we can delete some services.

You can execute next command for validate the docker-compose.yml with parameters on .env file.
```bash
docker-compose --env-file ./.env config
```

docker-compose.yml
```yml
version: '3.0'

services:

    symfony:
      image: trosiki/trosiki:symfony5
      volumes:
        - ${WWW}:/var/www
        - ${LOGS}:/var/log
      restart: always
      ports:
        - 9000:9000
      links:
        - mysql:mysql

    nginx-symfony:
      image: trosiki/trosiki:nginx
      volumes:
        - ${WWW}:/var/www
        - ${DEFAULT_CONF_NGINX}:/etc/nginx/conf.d/default.conf
        - ${DEFAULT_CONF_NGINX}:/etc/nginx/sites-available/default
        - ${EXTRA_CONF_NGINX}:/usr/local/etc/php/conf.d/extra-conf.ini
      ports:
        - 80:80
      depends_on:
        - symfony

    node:
      image: trosiki/trosiki:node
      ports:
        - 4200:4200
      volumes:
        - "/home/trosiki/Documentos/projects/www/trosfolio_angular/:/home/node/app/"

    mysql:
      image: mysql:8.0
      command: --default_authentication_plugin=mysql_native_password
      environment:
        MYSQL_DATABASE: ${DATABASE_NAME}
        MYSQL_ROOT_PASSWORD: root
      volumes:
        - ${PATH_MYSQL_DATA}:/var/lib/mysql
      ports:
        - 3306:3306
```

.env file:
```
# PERSONAL CONFIG
# WWW=/home/trosiki/Documentos/projects/www
# PATH_PROJECT=/var/www/trosfolio_api/public
# PATH_MYSQL_DATA=/home/trosiki/Documentos/projects/mysql-data
# DATABASE_NAME=trosfoliodata

# COMMON CONFIG
LOGS=/home/trosiki/Documentos/projects/log
DEFAULT_CONF_NGINX=/home/trosiki/Documentos/projects/docker/common/default.conf
EXTRA_CONF_NGINX=/home/trosiki/Documentos/projects/docker/common/extra-conf.ini
```
## Symfony5 Folder
This folder is the configuration from my Docker image in [Trosiki's Dockerhub](https://hub.docker.com/repository/docker/trosiki/trosiki/tags?page=1&ordering=last_updated).
You can use my configuration using in your *docker-compose.yml* the following image:
```yml
version: '3.0'

services:
    trosiki-symfony5:
        image: trosiki/trosiki:symfony5
```
### Content
* Symfony5
    * Dockerfile            - Dockerfile for build. You can use
    * common
        * default.conf      - [REQUIRED] Default configuration for NGINX
        * extra-conf.ini    - [OPTIONAL] **IF YOU DON'T USE THIS CONFIGURATION, YOU MUST TO DELETE DE COPY ON DOCKERFILE**. Additional configuration for NGINX
    * scripts
        * startup.sh        - [OPTIONAL] **IF YOU DON'T USE THIS CONFIGURATION, YOU MUST TO DELETE DE COPY ON DOCKERFILE**. Script for run the service of nginx and php-fpm
### Dockerfile explain
1. Using the *FROM php:7.3-fpm* for initialize the Dockerfile.
2. Continue updating and upgrading the system.
3. Install pdo_mysql
4. Install almost modules from php
5. Install some lib and nginx service
6. Install requirements for Symfony
7. COPY startup.sh and set permissions
8. Get and Install composer
9. COPY config for NGINX
10. Set Timezone
11. Set WORKDIR
12. Expose port 80
13. Exec startup.sh
