pipeline {
    agent any
    environment {
        DOCKER_TAG = getVersion()
    }
    stages {
        stage('Clone stage') {
            steps {
                git branch: 'main', url: 'https://github.com/Dechateau2035/datacamp_docker_angular.git'
            }
        }
        stage ('Docker Build') {
            steps {
                 bat 'docker build -t Dechateau2035/angular-app:latest .'
            }
        }
        stage ('DockerHub Push') {
            steps {
                bat 'sudo docker login –u username –p password'
                bat 'sudo docker push Dechateau2035/angular-app:latest'
            }
        }
    }
}
def getVersion(){
    def version = bat(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
    return version
}
