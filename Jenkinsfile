pipeline {
    agent {
        label "docker-agent"
    }
    triggers {
        githubPush()
    }

    environment {
        DOCKER_IMAGE = "ploc300/portfolio:latest"
    }

    stages {
        stage("Setup") {
            // This will clone the repository
            steps {
                echo "===== Setup stage started ====="
                echo "===== Cloning the repository ====="
                git(url: "https://github.com/Ploc300/Portfolio.git", branch: "main")
                echo "Repository cloned"
                echo "===== Setting up the environment ====="
                withPythonEnv("python3") {
                    sh "pip install pylint"
                    sh "pip install -r src/requirements.txt"
                }
                echo "Environment setup completed"
            }
        }
        stage("Validate") {
            // This will validate the code
            steps {
                script {
                    echo "===== Validating the code ====="
                    withPythonEnv("python3") {
                    sh "pylint src/*.py"
                    echo "Code validated"
                    }
                }
            }
        }
        stage("Build") {
            // This will build the docker image and push it to the docker hub
            steps {
                script {
                    echo "===== Building the docker image ====="
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }
        stage("Deploy") {
            // This will deploy the docker image on the server
            steps {
                script {
                    echo "===== Deploying the docker image ====="
                    sh "docker run -d -p 80:80 $DOCKER_IMAGE"
                }
            }
        }
    }
    post {
        always {
            echo "===== Saving the artifacts ====="
            archiveArtifacts allowEmptyArchive: true, artifacts: "pylint.log", fingerprint: true, followSymlinks: false
        }
    }
}
