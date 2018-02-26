FROM openjdk:8-jdk-alpine
COPY target/helloworld-1.0.0-SNAPSHOT.jar myapp.jar
RUN sh -c 'touch /myapp.jar'
EXPOSE 8081
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]