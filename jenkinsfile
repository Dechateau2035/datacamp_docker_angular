pipeline{
    environment{
        DOCKER_TAG = getVersion()
    }
    stages{
        stage('Clone stage'){
            steps{
                git https://github.com/Dechateau2035/datacamp_docker_angular.git
            }
        }
        stage('Docker Build'){
            steps{
                sh 'docker build -t kamklesh/angularapp:${DOCKER_TAG}.'
            }
        }
    }
}
def getVersion(){
    def version = bat returnStdout: true, script: 'git rev-parse --short HEAD'
    return version
}
