#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
        [$class: 'GitSCMSource',
         remote: 'https://github.com/amadinathaniel/jenkins-shared-library.git',
         credentialsId: 'github-with-token'
        ]
)

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    environment {
        IMAGE_NAME = 'amadinathaniel/demo-app:java-maven-1.0'
    }
    stages {
        stage("build app") {
            steps {
                script {
                    echo 'building application jar...'
                    buildJar()
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    echo 'building the docker image...'
                    buildImage(env.IMAGE_NAME)
                    dockerLogin()
                    dockerPush(env.IMAGE_NAME)
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo 'deploying the docker image to EC2...'
                        
                        def shellCmd = "bash ./server-cmds.sh ${IMAGE_NAME}"
                        
                    sshagent(['ec2-server-key']) {
                        sh "scp server-cmds.sh ec2-user@52.91.68.32:/home/ec2-user"
                        sh "scp docker-compose.yml ec2-user@52.91.68.32:/home/ec2-user"
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@52.91.68.32 ${shellCmd}"
                    }    
                }
            }
        }
    }
} 
