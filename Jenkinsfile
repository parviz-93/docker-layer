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
            }
        }
        stage('Build') {
            steps {
                sh 'python -m venv ${VENV_PATH}'
                sh '. ${VENV_PATH}/bin/activate'
                sh 'pip install --upgrade pip'
                sh 'pip install -r requirements.txt'
                sh 'pip install pylint'
                sh 'pip install pytes'
            }
        }
        stage('Test') {
            steps {
                sh 'pytest'
            }
        }

        stage('Docker Build'){
             steps {
                sh 'docker build . --file Dockerfile --tag flask-app:latest'
            }
        }
    }
}