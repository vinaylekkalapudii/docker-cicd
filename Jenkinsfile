pipeline {
    agent any
	tools {
      maven 'mvn3'
    }

    stages {
        stage('Build the source code') {
            steps {
                sh 'mvn clean package'
            }
        }
		
		stage('Build the docker image') {
            steps {
                sh 'docker build . -t amiyaranjansahoo/image1:v1'
            }
        }
		
		stage('Login to docker hub and Push the image') {
            steps {
			 withCredentials([string(credentialsId: 'docker_password', variable: 'docker_pwd')]) {
				docker login -u amiyaranjansahoo -p ${docker_pwd}
				docker push amiyaranjansahoo/image1:v1
			}
                
            }
        }
		
		stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
