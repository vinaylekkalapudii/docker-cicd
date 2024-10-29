pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/vinaylekkalapudii/docker-cicd'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t vinaylekkalapudii/dockerimg:v1 ."
                }
            }
        }

stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
                        sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push vinaylekkalapudii/dockerimg:v1"
            }
        }

stage('Deploy to Local Server') {
           steps {
               script {
                    // Stop and remove the existing container if it exists
                    sh """
                        docker stop mycontainer || true
                        docker rm mycontainer || true
                        
                        // Run the new Docker container
                        docker run -d -p 100:8080 --name mycontainer vinaylekkalapudii/dockerimg:v1
                    """
                }
            }
        }
    }
}
