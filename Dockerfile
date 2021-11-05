FROM openjdk:11
VOLUME /tmp
ADD notification.jar notification.jar
RUN echo "America/Fortaleza" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN bash -c 'touch /notification.jar'
ENTRYPOINT ["java","-jar","/notification.jar"]
