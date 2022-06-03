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
				sh 'docker build -t amiyaranjansahoo/dockerimg .'
			}
		}
		
		stage('Push to docker hub') {
			steps {
				echo "Code for pushing the docker image to docker hub"
			}
		}
		
		stage('Deploy to Dev server') {
			steps {
				echo "Code for deploying to Dev server"
			}
		}
		
		
	}
}
