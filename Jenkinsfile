pipeline{
  agent any
  tools{ jdk 'JDK17' }
  environment{
    JAVA_HOME = 'C:\\Program Files\\Java\\jdk-17'
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
        bat 'docker build -t kamklesh/angularapp:${DOCKER_TAG}.'
      }
    }
  }
}
def getVersion(){
    def version = bat returnStdout: true, script: 'git rev-parse --short HEAD'
    return version
}
