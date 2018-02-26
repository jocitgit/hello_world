node {
    docker.image('maven:alpine').inside('-v /root/.m2:/root/.m2') {
        stage('Build') {
        	checkout scm
            sh 'mvn -B -DskipTests clean package'
            stash includes: 'target/*.jar', name: 'targetfiles' 
        }
    }
}

node {
    unstash 'targetfiles'
    def customImage = docker.build("my-image:${env.BUILD_ID}")
    
}