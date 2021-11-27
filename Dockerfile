FROM openjdk:11
VOLUME /tmp
COPY app.jar app.jar
RUN echo "America/Fortaleza" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
ENTRYPOINT ["java","-jar","/app.jar"]
