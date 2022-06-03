
pipeline {
	agent any
	stages {
		stage('Maven Build') {
			sh 'mvn clean package'
		}
		
		stage('Docker Build image') {
			echo "Code for Build the docker image"
		}
		
		stage('Push to docker hub') {
			echo "Code for pushing the docker image to docker hub"
		}
		
		stage('Deploy to Dev server') {
			echo "Code for deploying to Dev server"
		}
		
		
	}
}
