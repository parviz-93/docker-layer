pipeline {
    agent {
        docker { image 'python:3.9-slim' }
    }

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Build') {
            steps {
                echo 'Hello World'
                sh 'uname -a'
            }
        }
    }
}