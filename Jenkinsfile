pipeline{
    agent none
    triggers {
        githubPush()
    }
    parameters {
        choice(name: 'PHASE', choices: ['all', 'validator'], description: 'Select the phase to run')
    }

    stages {
        stage('Validator') {
            agent any
            // This will validate the HTML, CSS, JS and Python files
            when {
                expression { params.PHASE == 'all' || params.PHASE == 'validator' }
            }
            steps {
                echo 'Validating HTML, CSS, JS and Python files'
                echo 'Starting with pylint...'
                flake8 --format=pylint main.py >> flake8.log || exit 1
                // sh '''
                //         for file in $(find . -name "*.py"); do
                //             flake8 --format=pylint $file >> flake8.log || exit 1
                //         done
                //     '''



            }
        }
        stage('Build') {
            // This will build the docker image and push it to the docker hub
            agent any
            when {
                expression { params.PHASE == 'all'}
            }
            steps {
                echo 'Building the docker image'
            }
        }
        stage('Deploy') {
            // This will deploy the docker image on the server
            agent any
            when {
                expression { params.PHASE == 'all'}
            }
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
