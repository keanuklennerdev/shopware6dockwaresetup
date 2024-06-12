## Shopware 6 Basic Dockware Setup
- Create docker-compose.yml
```bash
services:
    shopware:
        image: dockware/dev:6.5.8.8
        container_name: shopware
        ports:
            - "22:22"     # ssh
            - "80:80"     # apache2
            - "8888:8888" # watch admin
            - "9998:9998" # watch storefront proxy
            - "9999:9999" # watch storefront
        networks:
            - web
        environment:
            - XDEBUG_ENABLED=0
            - PHP_VERSION=8.2
            - NODE_VERSION=18
        # volumes:
            # - "./src:/var/www/html/"

networks:
    web:
        external: false
```

### execute docker commands

start container without bind mounting:

```docker compose up -d```

stop container:

```docker compose stop```

copy shopware files to local system:

```docker cp shopware:/var/www/html/. ./src```

enable bind mounting via volumes in ```docker-compose.yml```

start container with bind mounting:

```docker compose up -d```

change the owner of the local project path to www-data (ID:33):

```sudo chown www-data:www-data <ProjectBasePath> -R```

change basic permissions:

```sudo chgrp -R 33 ./src```

change write permissions for cache/log folder:

```sudo chmod a+w ./src/var/*```
