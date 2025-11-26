pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')   // Check GitHub every minute
    }

    stages {

        stage('Clone Repo') {
            steps {
                echo "Cloning GitHub Repository..."
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    dockerImage = docker.build("portfolio:latest")
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    echo "Stopping old container if running..."
                    // Stop + remove previous container safely
                    sh '''
                    docker stop portfolio || true
                    docker rm  portfolio || true
                    '''

                    echo "Starting new container on port 5000..."
                    // Run new container
                    sh '''
                    docker run -d -p 5000:80 --name portfolio portfolio:latest
                    '''
                }
            }
        }
    }
}
