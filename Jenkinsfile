pipeline {
	agent any
	stages {
		stage('Maven Build') {
			steps {
				sh 'mvn clean package'
			}
		}
		
		stage('Docker Build image') {
			steps {
				echo "Code for Build the docker image"
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
