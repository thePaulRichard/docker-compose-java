# Docker Compose Java

Docker-compose para o time de DevOps efetuar testes com aplicações JAVA.

Recursos disponiveis:

- build do .jar expondo para: http://localhost:8080
- mysql:8
- rabbitmq:3
- modo **DEBUG** 
  - para habilitar descomente a linha '13' em [`docker-compose`](./docker-compose.yml)

## Como usar

- Copie o Dockerfile original da aplicação e cole aqui.
- [`Dockerfile`](./Dockerfile) contém um exemplo.
  - Em alguns casos (error: exit code 0) é necessário adicionar o ENTRYPOINT ao final do Dockerfile, segue exemplo abaixo:
    
> ENTRYPOINT ["java","-jar","/ecommerce-service-provider-application.jar"]

- Copie o .jar neste diretório para efetuar o build.

Com os arquivos pronto, execute o comando abaixo para subir o app:

```
docker-compose up
```

Caso seja necessário fazer um re-build, então execute o comando abaixo:

```
docker-compose up --build
```
## Limpeza

Após finalizar os testes, execute o comando abaixo para limpar os recursos criados pelo docker-compose:

```
docker-compose down -v --rmi all
```
