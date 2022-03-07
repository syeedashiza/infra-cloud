pipeline
{
    agent 
    { 
        dockerfile true
    }
    stages
    {
        stage('Checkout Report') 
        {
            steps 
            {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/sachinrawat1111/Project']]])
   
            }
        }
        stage('HTML Report')
        {
         steps
         {
           publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/test-report/HTML', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
         }
        }
        stage('Coverage Report')
        {
         steps
         {
           publishCoverage adapters: [istanbulCoberturaAdapter('var/lib/jenkins/workspace/Demo3/test-report/coverage.xml')], sourceFileResolver: sourceFiles('NEVER_STORE')      
         }
         } 
        }
        }
