pipeline {
    agent {
        docker { image 'python:3.9-slim' }
    }

    stages {
        stage('Workdit') {
            steps {
                sh 'ls'
            }
        }
        stage('Build') {
            steps {
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
    }
}