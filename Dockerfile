FROM openjdk:11
VOLUME /tmp
ADD smaug-read.jar smaug-read.jar
RUN echo "America/Fortaleza" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN bash -c 'touch /smaug-read.jar'
ENTRYPOINT ["java","-jar","/smaug-read.jar"]
