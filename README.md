# Docker Compose Java

Docker-compose para testes com aplicações JAVA (Feito pelo time DevOps)

Recursos disponiveis até momento:

- build do .jar expondo para: http://localhost:8080
- mysql:8
- rabbitmq:3

## Como usar

- Copie o Dockerfile original da aplicação e cole aqui.
- [`Dockerfile`](./Dockerfile) contém um exemplo.
  - Em alguns casos é necessário adicionar o ENTRYPOINT ao final do Dockerfile, segue exemplo abaixo:
    
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

## TO-DO

Adicionar outros serviços como REDIS e MONGODB.

Qualque sugestão será bem-vinda.

Duvidas entre em contato com o time de DevOps.