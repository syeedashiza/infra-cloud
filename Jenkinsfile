pipeline {
    agent 
    { 
        dockerfile true
    }
    stages {
        stage('Checkout Report') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sachinrawat1111/Project']]])
                             
            }
        }
        stage('Sonarqube')
        {
         steps
         {
          script
          {
           def scannerHome = tool 'SonarQube Scanner 4.6.0.2311';
           withSonarQubeEnv("sonarqube-container") 
           {
            sh "${tool("sonarqube")}/bin/sonar-scanner" 
           }
          }
         }
        }
        stage('HTML Report')
        {
         steps
         {
           sh 'google-chrome /Project/HTML/index.html'
         }
        }
    }
}
