# Docker Compose Java

Docker-compose para o time de DevOps efetuar testes com aplicações JAVA.

Recursos disponiveis:

- build automatico do .jar expondo para: http://localhost:8080
- mysql:8 com suporte a dump na pasta [`dump`](./dump)
- rabbitmq:3
- elasticsearch:7.14.2
- kibana:7.14.2 expondo para http://localhost:5601
- modo **DEBUG** 
  - para habilitar descomente a linha '13' em [`docker-compose`](./docker-compose.yml)
  - ou em [`compose_mysql_rabbit_elastic.yml`](./compose_mysql_rabbit_elastic.yml)

## Como usar

- Faça o clone desse repositorio.
- Execute o script: ['build_jar.sh`](./build_jar.sh) e informe os valores solicitados (repo, branch, projeto).
  - Caso o repositorio da aplicação java tenha varios 'modulos' (subpastas), digite o nome do modulo quando solicitado pelo script.
  - Requisitos minimos para rodar o script: git, mavem, docker, docker-compose.
- Se o script rodar com sucesso

Execute o comando abaixo para subir o app (com os recursos minimos: mysql e rabbitmq):

```
docker-compose up
```

Para subir com elaticsearch e kibana, aponte para o arquivo **docker-compose_mysql_rabbit_elastic.yml**

```
docker-compose -f docker-compose_mysql_rabbit_elastic.yml up
```

Caso seja necessário fazer um re-build, então execute o comando abaixo:

```
docker-compose up --build
```
## Limpeza

Após finalizar os testes, execute o comando abaixo para limpar os recursos criados pelo docker-compose:

```
docker-compose down -v --rmi all
#ou
docker-compose -f docker-compose_mysql_rabbit_elastic.yml down -v --rmi all
```

TO-DO
- Build automatico da aplicação (em testes)