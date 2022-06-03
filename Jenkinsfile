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
					sh "docker login -u amiyaranjansahoo --password-stdin ${dockerpwd}"
					sh "docker push amiyaranjansahoo/dockerimg:v1"
				}
			}
		}
		
		stage('Deploy to Dev server') {
			steps {
				echo "Code for deploying to Dev server"
			}
		}
		
		
	}
}
