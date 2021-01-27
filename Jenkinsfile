pipeline {
    agent 
    { 
        dockerfile true
    }
    stages {
        stage('Checkout Report') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: '/var/lib/jenkins/jobs/Scanner/htmlreports/HTML_20Report']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sachinrawat1111/Project']]])
                             
            }
        }
        stage('HTML Report')
        {
         steps
         {
           publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/jobs/Scanner/htmlreports/HTML_20Report', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
         }
        }
    }
}
