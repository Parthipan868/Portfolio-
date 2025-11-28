pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')   // Check GitHub every minute
    }

    environment {
        DOCKER_IMAGE = "portfolio:latest"
        CONTAINER_NAME = "portfolio"
        PORT = "5000"
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
                    dockerImage = docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    echo "Stopping old container if running..."
                    // Stop + remove previous container safely
                    sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    """

                    echo "Starting new container on port ${PORT}..."
                    // Run new container
                    sh """
                    docker run -d -p ${PORT}:80 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}
                    """
                }
            }
        }

        // Optional: Deploy to AWS S3 using Terraform
        // Uncomment and configure when ready to deploy from Jenkins
        /*
        stage('Deploy to AWS S3') {
            steps {
                script {
                    echo "Deploying to AWS S3 via Terraform..."
                    
                    // Ensure Terraform is installed
                    sh 'terraform version'
                    
                    dir('terraform') {
                        // Initialize Terraform
                        sh 'terraform init'
                        
                        // Plan deployment
                        sh 'terraform plan -out=tfplan'
                        
                        // Apply deployment
                        sh 'terraform apply -auto-approve tfplan'
                        
                        // Output website URL
                        sh 'terraform output website_url'
                    }
                }
            }
        }
        */

        stage('Verify Deployment') {
            steps {
                script {
                    echo "Verifying deployment..."
                    
                    // Wait for container to be fully running
                    sleep(time: 3, unit: 'SECONDS')
                    
                    // Check if container is running
                    sh """
                    docker ps | grep ${CONTAINER_NAME}
                    """
                    
                    echo "✅ Deployment successful!"
                    echo "🌐 Portfolio is live at http://localhost:${PORT}"
                }
            }
        }
    }

    post {
        success {
            echo "🎉 Pipeline completed successfully!"
            echo "📦 Docker container '${CONTAINER_NAME}' is running on port ${PORT}"
        }
        
        failure {
            echo "❌ Pipeline failed. Check logs for details."
            
            // Clean up on failure
            sh """
            docker stop ${CONTAINER_NAME} || true
            docker rm ${CONTAINER_NAME} || true
            """
        }
    }
}
