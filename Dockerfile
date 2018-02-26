FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/helloworld-0.0.1-SNAPSHOT.jar myapp.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]