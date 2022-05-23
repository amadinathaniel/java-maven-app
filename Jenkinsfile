pipeline {
    agent any
    tools{
        maven 'Maven'
    }
    stages {
        stage("build jar") {
            steps {
                script {
                    echo "building the application..."
                    sh 'mvn package'
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    echo "building the docker image..."
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernamevariable: 'USER' )]) {
                        sh 'docker build -t amadinathaniel/demo-app:jma-2.0 .'
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh 'docker push amadinathaniel/demo-app:jma-2.0'
                    }
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                     echo "Deploying the application..."
                }
            }
        }
    }
}
