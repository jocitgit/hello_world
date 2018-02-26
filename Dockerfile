FROM openjdk:8-jdk-alpine
ADD target/helloworld-1.0.0-SNAPSHOT.jar myapp.jar
EXPOSE 8081
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]