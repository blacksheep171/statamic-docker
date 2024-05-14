# Setup Docker Statamic Project
[About Statamic, see the documetation!](https://statamic.dev/)

# Docker Image Requires
Requires Image:
- PHP >=8.1
- Nginx
- Mysql/MariaDB
- Elasticsearch
- Redis Server
- PHPMyAdmin

### Usage
Clone Repository
```sh
git clone https://github.com/statamic/cms.git
```

Copy **.env.example** to **.env**
```sh
cp .env.example .env
```

Configuration variables in **.env**
```
APP_NAME="docker-statamic"
APP_URL=http://local-terrace.com

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=statamic
DB_USERNAME=root
DB_PASSWORD=root

CACHE_DRIVER=redis
QUEUE_CONNECTION=redis
SESSION_DRIVER=redis

REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379
```

To build and run the containers for application
```sh
docker-compose up -d
```

Access container
```sh
docker-compose exec php bash
```

Install dependencies via composer
```sh
composer install
```

Generate new key for project
```sh
php artisan key:generate
```

Install **eloquent-driver** composer packages and create migration
```sh
composer require statamic/eloquent-driver:3.4.1
php please auth:migration
php artisan vendor:publish --tag="statamic-eloquent-config"
php artisan vendor:publish --provider="Statamic\Eloquent\ServiceProvider" --tag=migrations
php artisan vendor:publish --tag="statamic-eloquent-entries-table"
php artisan migrate
```

Access host
[http://local-terrace.com](http://local-terrace.com/cp/auth/login)

Generate new user to login the dashboard
```sh
php please make:user
```