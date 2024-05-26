pipeline{
    agent any
    triggers {
        githubPush()
    }

    stages {
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

    post {
        always {
            archiveArtifacts allowEmptyArchive: true, artifacts: 'flake8.log', fingerprint: true, followSymlinks: false
        }
    }
}
