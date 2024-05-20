pipeline {
    agent any
	
	tools {
		maven 'mvn3'
    }


    stages {
        stage('Build using maven') {
            steps {
                sh 'mvn clean package'
            }
        }
		
		stage('Build the image') {
            steps {
                sh 'docker build -t amiyaranjansahoo/myimg:v1 .'
            }
        }
		
		stage('Upload to Docker hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub_passwd', variable: 'docker_passwd')]) {
					sh "docker login -u amiyaranjansahoo -p ${docker_passwd}"
					sh "docker push amiyaranjansahoo/myimg:v1"
				}
            }
        }
		
		stage('Deploy to dev remote server') {
            steps {
                sshagent(['docker-dev']) {
					sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.46.125 docker run -itd -p 8080:8080 --name mycontainer amiyaranjansahoo/myimg:v1"
				}
            }
        }
    }
}
