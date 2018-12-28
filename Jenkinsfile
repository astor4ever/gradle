pipeline {
    agent {
        node {
            label 'DV'
        }
    }
    stages {
        stage('Build Jar') {
            steps {
                sh 'sh gradlew build -x test'
            }
        }
        stage('Build Image') {
            steps {
                script {
                 sh 'sh /snap/bin/docker build -t astor4ever/docker .'
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'test') {
                        sh 'sh /snap/bin/docker push astor4ever/docker:latest'
                    }
                }
            }
        }
    }
}