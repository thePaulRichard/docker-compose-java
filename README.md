# Docker Compose for .jar
**A simple docker-compose to run .jar apps.**

[![Demo](/poster.png)](/demo.webm)

## Features:
- Automatic build form app.jar and expose to: http://localhost:8080
- mysql:8 with dump support in the [`dump`](./dump) folder.
- rabbitmq:3
- elasticsearch:7.14.2
- kibana:7.14.2 exposing to: http://localhost:5601
- **DEBUG** mode.
  - Uncomment the line '13' on [`docker-compose`](./docker-compose.yml).
  - or in the file [`compose_mysql_rabbit_elastic.yml`](./compose_mysql_rabbit_elastic.yml).

## How to use
- Clone this repo locally.
- Run the script: [build_jar.sh](./build_jar.sh) and pass the values as asked (repo, branch, module).
  - If the **repo** has multiple modules, inform the name of the module to build.
    - Limitations: The module name must be in a subfolder with the same name as the module.
  - Minimum requirements to run the script: git, maven, docker, docker-compose.
- If the script runs successfully, it will copy the .jar in the target folder and copy it to the root folder. If the script doesn't run as expected, you can put the app in the root manually, but the name of the .jar must be: **app.jar** for the docker-compose run.

The script will ask you for what docker-compose to run:
- Basic: Mysql and RabbitMQ
- Complete: Mysql, RabbitMQ, ElasticSearch, and Kibana.

You also can execute the docker-compose manually. It needed the app.jar in the root for this. 

### Basic build:
```
docker-compose up
```

### Complete build:
```
docker-compose -f docker-compose_mysql_rabbit_elastic.yml up
```

To do a **re-build** inform the --build parameter:
```
docker-compose up --build
```

## Clean
You can clean the docker images and container with the following command:

```
docker-compose down -v --rmi all
#or
docker-compose -f docker-compose_mysql_rabbit_elastic.yml down -v --rmi all
```

## TO-DO
- [ ] Build with Github actions
- [ ] Create Python build script
