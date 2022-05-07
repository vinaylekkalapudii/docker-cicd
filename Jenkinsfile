pipeline {
    agent any
    tools {
         maven 'm3'
    }
    stages {
        //stage('git clone') {
           // steps {
               // git credentialsId: 'git_authentication', url: 'https://github.com/amiyaranjansahoo/training-mvn'
           // }
        //}
    
        stage('maven build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('tomcat deployment') {
            steps {
                sshagent(['tomcat']) {
                    sh 'scp -o StrictHostKeyChecking=no target/myweb.war ec2-user@172.31.37.82:/software/tomcat9/webapps'
                	sh 'ssh ec2-user@172.31.37.82 /software/tomcat9/bin/shutdown.sh'
                	sh 'ssh ec2-user@172.31.37.82 /software/tomcat9/bin/startup.sh'
                }
            }
        }
    }
    
    
}


