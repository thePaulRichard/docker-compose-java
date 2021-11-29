FROM openjdk:11
COPY app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
