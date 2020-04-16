
# docker

    docker ps

## build
Best practice is to use an accountname/dockername when building (see docker-hub below):

    docker build --tag brettonw/docker:1.0.0 .

## run
See documentation at https://docs.docker.com/engine/reference/run/

For interactive execution:

    docker run --publish 80:8080 --publish 27017:27017 --name brettonw-docker --env MONGO_INITDB_ROOT_USERNAME=brettonw-root --env MONGO_INITDB_ROOT_PASSWORD=xxx -it brettonw/docker:1.0.0

For standalone execution (remove --bind_ip_all to keep the mongo instance private):

    docker run --publish 80:8080 --publish 27017:27017 --name brettonw-docker --env MONGO_INITDB_ROOT_USERNAME=brettonw-root --env MONGO_INITDB_ROOT_PASSWORD=xxx --detach brettonw/docker:1.0.0 --bind_ip_all

## stop 
Stop and remove the running instance:

    docker stop brettonw-docker
    docker rm brettonw-docker
    docker stop brettonw-docker && docker rm brettonw-docker


# docker-machine
On MacOS (https://docs.docker.com/machine/get-started/)

Create machine named "default":

    docker-machine create --driver virtualbox default
    
List all machines:
    
    docker-machine ls

Get the IP of the machine named "default":

    docker-machine ip default

Configure the shell to allow docker to work with our running machine:

    eval $(docker-machine env)
    
Stop the machine named "default":

    docker-machine stop default

# docker-hub

TBD

# mongo

## login
Log in unauthenticated:

    mongo $(docker-machine ip default):27017

Log in authenticated as root:

    mongo -u brettonw-root -p xxx --authenticationDatabase admin $(docker-machine ip default):27017
    
## commands
Create user:
    
    show dbs
    use admin
    db.createUser({ user: "brettonw-admin", pwd: "xxx", roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
    use users
    db.createUser({ user: "brettonw-user", pwd: "xxx", roles: [ { role: "dbOwner", db: "example" },{ role: "dbOwner", db: "example-test" } ] });
    show users
    exit
    
 ## connection strings
 
     mongodb://brettonw-root:xxx@ipaddress.com:27017/admin
     mongodb://brettonw-root:xxx@ipaddress.com:27017/admin
     mongodb://brettonw-root:xxx@ipaddress.com:27017/users
    
