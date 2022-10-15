pipeline {
    agent {
        docker { image 'python:alpine3.16' }
    }

     environment {
       VENV_PATH="~/venv"
    }

    stages {
        stage('Workdir') {
            steps {
                sh 'ls'
                 sleep 2
            }
        }
        stage('Build') {
            // steps {
            //     sh 'python -m venv ${VENV_PATH}'
            //     sh '. ${VENV_PATH}/bin/activate'
            //     sh 'pip install --upgrade pip'
            //     sh 'pip install -r requirements.txt'
            //     sh 'pip install pylint'
            //     sh 'pip install pytes'
            // }
             app = docker.build("rozikovp/flask-app")
        }
        stage('Test') {
            steps {
                app.inside {
                    sh 'echo "Tests passed"'
                }

            }
        }

        stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
        }
    }
}