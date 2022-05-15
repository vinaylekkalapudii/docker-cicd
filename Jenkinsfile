@Library('sharedlib')_
pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    stages {
        //stage("Git clone") {
            //steps {
             //   git credentialsId: 'git_cred', url: 'https://github.com/amiyaranjansahoo/training-mvn.git'
            //}
        //}
        
        stage("Build the source code using maven") {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage("SCP the artifcat and deploy to tomcat") {
            steps {
                deployTomcat('tomcat-new','ec2-user','172.31.37.225') 
            }
        }
    }
}
