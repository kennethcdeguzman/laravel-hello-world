FROM php:8.1-fpm-alpine

#Update apk and install testing tools
RUN apk update
RUN apk add bash
RUN apk add curl

#Install composer for PHP
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Create hello world laravel application
RUN mkdir "hello-world"
RUN composer create-project laravel/laravel hello-world
WORKDIR ./hello-world

#Copy custom route and view to the laravel app on the container
COPY ./resources/routes/web.php ./routes
COPY ./resources/views/hello.blade.php ./resources/views

#Expose port 8080
EXPOSE 8080/tcp

#Set entrypoint
ENTRYPOINT ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]