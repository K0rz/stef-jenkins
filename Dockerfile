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