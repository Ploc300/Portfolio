pipeline{
    agent none
    triggers {
        githubPush()
    }

    stages {
        stage('Validator') {
            // This will validate the python, html, js and css files using W3C validator and pylint
            // agent dockerfile {
            //     filename 'docker/validatorDockerfile'
            // }
            steps {
                echo 'Validating HTML, CSS, JS and Python files'
            }
        }
        stage('Build') {
            // This will build the docker image and push it to the docker hub
            // agent dockerfile {
            //     filename 'docker/buildDockerfile'
            // }
            steps {
                echo 'Building the docker image'
            }
        }
        stage('Deploy') {
            // This will deploy the docker image on the server
            // agent any
            steps {
                echo 'Deploying the docker image'
            }
        }
    }
}
