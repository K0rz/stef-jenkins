FROM openjdk:8-jre-alpine
MAINTAINER Adrien Lecharpentier <adrien.lecharpentier@gmail.com>

RUN adduser \
  -h /var/lib/simple-app \
  -D \
  simpleapp simpleapp

USER simpleapp
WORKDIR /var/lib/simple-app

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "simple-app.jar"]

ADD target/simple-app-*.jar simple-app.jar

 

