#!/usr/bin/env groovy

pipeline {
    agent any
    stages {
        stage('build app') {
            steps {
               script {
                   echo "building the application..."
               }
            }
        }
        stage('build image') {
            steps {
                script {
                    echo "building the docker image..."
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                   echo 'deploying docker image...'
                   withKubeConfig([credentialsId: 'lke-credentials', serverUrl: 'https://95350dc3-f614-45fc-9baf-4f01991d88b5.eu-west-2.linodelke.net']) {
                       sh 'kubectl create deployment nginx-deployment --image=nginx'
                   }
                }
            }
        }
    }
}
