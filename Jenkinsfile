pipeline {
  agent none
  stages{
  	stage('Build') { 
  		agent {
        	docker {
            	image 'maven:alpine' 
            	args '-v /root/.m2:/root/.m2 -p 8081:8081'
            } 
        }
        steps {
            sh 'mvn -B -DskipTests clean package'
            stash includes: 'target/*.jar', name: 'targetfiles' 
        }
    }
    stage('Test') {
    	agent {
			docker {
				image 'maven:alpine' 
				args '-v /root/.m2:/root/.m2 -p 8081:8081' 
			}
        }
        steps {
            sh 'mvn test'
        }
        post {
            always {
                junit 'target/surefire-reports/*.xml'
            }
        }
    }
    stage('Containerize') {
        agent {
            node {
                label 'DockerDefault'
            }
         }
         steps {
            script{
                unstash 'targetfiles'
                sh 'ls -l -R'
                	def newApp = docker.build "jocitdocker/myapp:${env.BUILD_TAG}"
            		newApp.push()
            	
            }
         }
      }	
   }
}