# Laravel hello world app

___

## Dockerfile setup:
- **Base image**: php:8.1-fpm-alpine
- **Composer version**: latest
- **Host binding**: 0.0.0.0
- **Port Binding**: 8080

## Building and publishing image to Dockerhub:
1. On the project directory, build and tag the image
````
$ docker built -t kennethcdeguzman/hello-world:latest .
````
2. If image is already built, you can re tag the image with the dockerhub repo and tag
````
$ docker tag hello-world kennethcdeguzman/hello-world:latest
````
3. Login to dockerhub with username and password or use an access token generated in the dockerhub UI

````
$ docker login --username <user-name> --password <password/token>
````
4. Publish image to public dockerhub image repository
````
$ docker push kennethcdeguzman/hello-world:latest
````

## References:
- **Dockerhub public repo**: [kennethcdeguzman/hello-world](https://hub.docker.com/r/kennethcdeguzman/hello-world)
- **Docker Pull Command**: 
````
$ docker pull kennethcdeguzman/hello-world
````
- **Laravel Quickstart**: https://laravel.com/docs/4.2/quick
- **Laravel routing**: https://laravel.com/docs/5.3/routing#basic-routing
- **Laravel Views**: https://laravel.com/docs/5.3/views