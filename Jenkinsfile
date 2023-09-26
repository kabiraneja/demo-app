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
                sh "mvn clean package -DskipTests"

                // Stash the .jar file
                // stash includes: '/var/jenkins_home/workspace/my-pipeline/target/demo-2.jar', name: 'demo-2'

                // Stash the Dockerfile
                // stash includes: '/var/jenkins_home/workspace/my-pipeline/Dockerfile', name: 'Dockerfile'
            }
        }

        stage('Deploy to Docker') {
            steps {
                 // Unstash the .jar file
                    // unstash 'demo-2.jar'

                // Unstash the Dockerfile
                    // unstash 'Dockerfile'

                // Define the destination path on the host for the .jar file
                    // def jarDestinationPath = '~/demo-2.jar'

                // Define the destination path on the host for the Dockerfile
                    // def dockerfileDestinationPath = '~/Dockerfile'
                
                // Copy the built .jar file to the EC2 instance
                sh ' scp -i /var/jenkins_home/.ssh/id_rsa /var/jenkins_home/workspace/my-pipeline/target/demo-2.jar root@13.235.103.196:~/'
                sh ' scp -i /var/jenkins_home/.ssh/id_rsa /var/jenkins_home/workspace/my-pipeline/Dockerfile root@13.235.103.196:~/'

                // sh 'docker cp jenkins:/var/jenkins_home/workspace/my-pipeline/target/demo-2.jar ~/ '
                // sh 'docker cp jenkins:/var/jenkins_home/workspace/my-pipeline/Dockerfile ~/ '

                 // sh "cp -r /var/jenkins_home/workspace/my-pipeline/target/demo-2.jar ~/demo-2.jar"
                 // sh "cp -r /var/jenkins_home/workspace/my-pipeline/Dockerfile ~/Dockerfile"
                
                // SSH into the EC2 instance and deploy the .jar in Docker
                sh "ssh root@13.235.103.196 'docker stop demo-2 || true'"
                sh "ssh root@13.235.103.196 'docker rm demo-2 || true'"
                sh "ssh root@13.235.103.196 'docker rmi demo-2 || true'"
                sh "ssh root@13.235.103.196 'docker build -t demo-2 .'"
                sh "ssh root@13.235.103.196 'docker run -it -d -p 9091:9091 --name demo-2 demo-2'"
            }
        }
    }
}
