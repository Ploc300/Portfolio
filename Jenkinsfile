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
                git(url: 'https://github.com/Ploc300/Portfolio.git', branch: 'main')
                echo 'Repository cloned'
            }
        }
        stage('Validate') {
            // This will validate the code
            steps {
                script {
                    echo 'Validating the code'
                    pylint --msg-template='\\{path\\}:\\{line\\}: [\\{msg_id\\}, \\{obj\\}] \\{msg\\} (\\{symbol\\})' src/main.py > pylint.log
                }
            }
        }
        stage('Build') {
            // This will build the docker image and push it to the docker hub
            steps {
                script {
                    echo 'Building the docker image'
                }
            }
        }
        stage('Deploy') {
            // This will deploy the docker image on the server
            steps {
                script {
                    echo 'Deploying the docker image'
                }
            }
        }
    }
    post {
        always {
            echo 'Saving artifacts'
            archiveArtifacts allowEmptyArchive: true, artifacts: 'pylint.log', fingerprint: true, followSymlinks: false
            echo 'Cleaning up workspace'
            cleanWs()
        }
    }
}
