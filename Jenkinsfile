pipeline{
    agent none
    triggers {
        githubPush()
    }
    parameters {
        booleanParam(name: 'DEBUG', defaultValue: 'false', description: 'Enable debug mode')
        choice(name: 'PHASE', choices: ['all', 'validator', 'build', 'deploy', 'force_deploy'], description: 'Select the phase to run')
    }

    stages {
        stage('Validator') {
            // This will validate the python, html, js and css files using W3C validator and pylint
            // agent dockerfile {
            //     filename 'Dockerfile'
            //     dir 'docker/validator'
            //     label 'docker-validator'
            //     additionalBuildArgs '-e debug=${DEBUG}'

            // }
            steps {
                echo 'Validating HTML, CSS, JS and Python files'
                echo 'Debug mode is ${params.DEBUG}'
            }
        }
        stage('Build') {
            // This will build the docker image and push it to the docker hub
            agent any
            steps {
                echo 'Building the docker image'
            }
        }
        stage('Deploy') {
            // This will deploy the docker image on the server
            agent any
            steps {
                echo 'Deploying the docker image'
            }
        }
    }
}
