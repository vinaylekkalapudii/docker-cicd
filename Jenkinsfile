pipeline {
	agent any
	tools {
  		maven 'm3'
	}
	stages {
		stage('Maven Build') {
			steps {
				sh 'mvn clean package'
			}
		}
		
		stage('Docker Build image') {
			steps {
				sh 'docker build -t amiyaranjansahoo/dockerimg:v1 .'
			}
		}
		
		stage('Push to docker hub') {
			steps {
				withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerpwd')]) {
					sh "docker login -u amiyaranjansahoo -p ${dockerpwd}"
					sh "docker push amiyaranjansahoo/dockerimg:v1"
				}
			}
		}
		
		stage('Deploy to Dev server') {
			steps {
				sshagent(['linux-agent']) {
    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.33.15 docker container run -itd -p 8080:8080 --name amiya  amiyaranjansahoo/dockerimg:v1"
}
			}
		}
		
		
	}
}
