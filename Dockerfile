FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD /var/jenkins_home/workspace/hello_world_pipeline/target/helloworld-0.0.1-SNAPSHOT.jar myapp.jar
RUN sh -c 'touch /myapp.jar'
EXPOSE 8081
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]