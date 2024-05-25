pipeline{
    agent none
    }

    stages {
        stage('Validator') {
            // This will validate the python, html, js and css files using W3C validator and pylint
            agent dockerfile {
                filename 'docker/validatorDockerfile'
            }
            steps {
                sh 'apk add'
            }
        }
    }
