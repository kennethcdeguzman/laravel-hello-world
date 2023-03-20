FROM php:8.1-fpm-alpine

RUN apk update
RUN apk add bash
RUN apk add curl

#Install composer

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir "hello-world"

RUN composer create-project laravel/laravel hello-world

WORKDIR ./hello-world

COPY ./resources/routes/web.php ./routes
COPY ./resources/views/hello.blade.php ./resources/views

EXPOSE 80/tcp

ENTRYPOINT ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]