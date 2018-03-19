FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/helloworld-0.0.1-SNAPSHOT.jar myapp.jar
EXPOSE 8081
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]
