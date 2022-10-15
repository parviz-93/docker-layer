pipeline {
    agent {
        docker { image 'python:3.9-slim' }
    }

     environment {
       VENV_PATH="~/venv"
    }

    stages {
        stage('Workdit') {
            steps {
                sh 'ls'
            }
        }
        stage('Build') {
            steps {
                sh 'python -m venv ${VENV_PATH}'
                sh '. ${VENV_PATH}/bin/activate'
                sh 'python -m pip install --upgrade pip'
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