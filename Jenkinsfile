pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')   // Jenkins checks GitHub every 1 minute
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo "Cloning GitHub Repository..."
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "No build step required for static HTML portfolio"
            }
        }

        stage('Deploy') {
            steps {
                echo "Deployment step completed (example)..."
            }
        }
    }
}
