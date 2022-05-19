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
                deployTomcat('tomcat','ec2-user','172.31.37.225') 
            }
        }
		
		stage("Upload the artifact to nexus repository manager") {
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'myweb', classifier: '', file: 'target/myweb.war', type: 'war']], 
				credentialsId: 'nexus3', 
				groupId: 'in.javahome', 
				nexusUrl: '172.31.37.94:8081', 
				nexusVersion: 'nexus3', 
				protocol: 'http', 
				repository: 'sample-snapshot', 
				version: '0.0.2-SNAPSHOT' 
            }
        }
    }
}
