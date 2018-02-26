pipeline {
  agent none
  stages{
  	stage('Build') { 
  		agent {
        docker {
            image 'maven:alpine' 
            args '-v /root/.m2:/root/.m2 -p 8081:8081' 
        }
        steps {
            sh 'mvn -B -DskipTests clean package'
            stash includes: 'target/*.jar', name: 'targetfiles' 
        }
    }
   }
}
