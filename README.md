# Laravel hello world app

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

## Running the hello-world laravel app as a deployment and expose the deployment to a service

1. Go to your project directory /manifest dir and apply using hello-world.yaml manifest
````
$ kubectl apply -f hello-world.yaml
````
2. On the same directory /manifest , apply the hello-world-svc.yaml
````
$ kubectl apply -f hello-world-svc.yaml
````

## Creating the ingress controller and ingress resource

1. Install an ingress controller. The project is currently using nginx controller. Run the following command to install the nginx controller resources into the cluster
````
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.6.4/deploy/static/provider/cloud/deploy.yaml
````
2. Create an ingress resource with the following values
    - ingressClassName: nginx
    - host: demo.localdev.me
    - paths.backend.service: hello-world-svc
    - port.number: 8080
    - path: /hello

## References:
- **Dockerhub public repo**: [kennethcdeguzman/hello-world](https://hub.docker.com/r/kennethcdeguzman/hello-world)
- **Docker Pull Command**: 
````
$ docker pull kennethcdeguzman/hello-world
````
- **Laravel Quickstart**: https://laravel.com/docs/4.2/quick
- **Laravel routing**: https://laravel.com/docs/5.3/routing#basic-routing
- **Laravel Views**: https://laravel.com/docs/5.3/views