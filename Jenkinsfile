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

        // stage('Deploy to Docker') {
        //     steps {
        //         // Copy the built .jar file to the EC2 instance
        //         sh 'scp target/your-app.jar ec2-user@<EC2_IP>:~/'

        //         // SSH into the EC2 instance and deploy the .jar in Docker
        //         sh "ssh ec2-user@<EC2_IP> 'docker stop your-app-container || true'"
        //         sh "ssh ec2-user@<EC2_IP> 'docker rm your-app-container || true'"
        //         sh "ssh ec2-user@<EC2_IP> 'docker build -t your-app .'"
        //         sh "ssh ec2-user@<EC2_IP> 'docker run -d -p 8080:8080 --name your-app-container your-app'"
        //     }
        // }
    }
}
