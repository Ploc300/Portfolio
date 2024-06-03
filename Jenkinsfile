pipeline{
    agent any
    triggers {
        githubPush()
    }

    environment {
        DOCKER_IMAGE = 'ploc300/portfolio:latest'
    }

    stages {
        stage('Clone') {
            // This will clone the repository
            steps {
                echo 'Cloning the repository'
                git clone 'https://github.com/Ploc300/Portfolio.git'
                echo 'Repository cloned'
            }
        }
        stage('Validate') {
            // This will validate the code
            steps {
                echo 'Validating the code'
            }
        }
        stage('Build') {
            // This will build the docker image and push it to the docker hub
            steps {
                echo 'Building the docker image'
            }
        }
        stage('Deploy') {
            // This will deploy the docker image on the server
            steps {
                echo 'Deploying the docker image'
            }
        }
    }
}
