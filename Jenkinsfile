pipeline {
    agent any
     environment {
        GIT_SSH_COMMAND = "ssh -o StrictHostKeyChecking=no"
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                withMaven {
                sh 'mvn clean package -DskipTests'                
                }
            }
        }

        stage('Deploy to Docker') {
            steps {
                // Copy the built .jar file to the EC2 instance
                sh ' scp -i id_rsa /var/jenkins_home/workspace/demo-job-2/target/demo-2.jar root@3.111.31.228:~/'
                sh ' scp -i id_rsa /var/jenkins_home/workspace/demo-job-2/Dockerfile root@3.111.31.228:~/'
                
                // SSH into the EC2 instance and deploy the .jar in Docker
                sh "ssh root@3.111.31.228 'docker stop demo-2 || true'"
                sh "ssh root@3.111.31.228 'docker rm demo-2 || true'"
                sh "ssh root@3.111.31.228 'docker rmi demo-2 || true'"
                sh "ssh root@3.111.31.228 'docker build -t demo-2 .'"
                sh "ssh root@3.111.31.228 'docker run -it -d -p 9091:9091 --name demo-2 demo-2'"
            }
        }
    }
}
