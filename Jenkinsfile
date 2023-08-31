pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build the Spring Boot application using Maven
                sh 'mvn clean package'
            }
        }

        stage('Deploy to Docker') {
            steps {
                // Copy the built .jar file to the EC2 instance
                sh ' scp -i id_rsa /var/jenkins_home/workspace/spring-mvn-pipeline/target/demo-1-build.jar root@13.127.255.192:~/'

                // SSH into the EC2 instance and deploy the .jar in Docker
                sh "ssh root@13.127.255.192 'docker stop demo-1 || true'"
                sh "ssh root@13.127.255.192 'docker rm demo-1 || true'"
                sh "ssh root@13.127.255.192 'docker build -t demo-1-build .'"
                sh "ssh toot@13.127.255.192 'docker run -d -p 9090:9090 --name demo-1 demo-1-build'"
            }
        }
    }
}
