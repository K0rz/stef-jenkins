<<<<<<< HEAD
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
=======
 docker.withServer('tcp://51.38.188.213:2375', '') {
        image = docker.build("simple-app", '-f Dockerfile .')
        node {
          container = image.run('-P')
          ip = container.port(8080)
        }
        try {
            input message: "Is http://${ip} ok?", ok: 'Publish'
        } finally {
            node { container.stop() }
        }
   }
>>>>>>> 980df67a395dd3d857d6e01153e3b04f3db0ff6f
