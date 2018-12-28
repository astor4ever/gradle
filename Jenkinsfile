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
                 sh '/snap/bin/docker build -t astor4ever/docker .'
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        sh '/snap/bin/docker push ${BUILD_NUMBER}'
                        sh '/snap/bin/docker push latest'
                    }
                }
            }
        }
    }
}