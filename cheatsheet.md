
docker ps

# best practice is to use an accountname/dockername
docker build --tag brettonw/docker:1.0.0 .

# interactive or standalone (remove --bind_ip_all to keep the mongo instance private)
docker run --publish 8080:8080 --publish 27017:27017 --name brettonw-docker -it brettonw/docker:1.0.0
docker run --publish 8080:8080 --publish 27017:27017 --name brettonw-docker --detach brettonw/docker:1.0.0 --bind_ip_all
docker run --publish 80:8080 --publish 27017:27017 --name brettonw-docker --detach brettonw/docker:1.0.0 --bind_ip_all

docker stop brettonw-docker
docker rm brettonw-docker
docker stop brettonw-docker && docker rm brettonw-docker

mongo $(docker-machine ip default):27017

mongo -u brettonw -p xxx --authenticationDatabase admin $(docker-machine ip default):27017

# docker-machine commands on MacOS (https://docs.docker.com/machine/get-started/)
docker-machine create --driver virtualbox default
docker-machine ls

docker-machine ip default

eval $(docker-machine env)
docker-machine stop default

# docker-hub
