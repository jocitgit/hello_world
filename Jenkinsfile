pipeline {
    agent {
        docker {
            image 'maven:alpine' 
            args '-v /root/.m2:/root/.m2 -p 8081:8081' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
		stage('Test') {
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
			steps {
				sh ' mvn install dockerfile:build'
			}
		}
		stage('Deliver') {
			steps {
				sh 'mvn dockerfile:push'
			}
		}
		stage('Deploy') { 
			when {
                branch 'deploy'
            }
            steps {
                sh 'java -jar target/helloworld-0.0.1-SNAPSHOT.jar' 
            }
        }
    }
}