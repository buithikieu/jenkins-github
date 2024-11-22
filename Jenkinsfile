pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "kieubui112543/test_cicd:v1" // Thay bằng Docker Hub username/repo
    }
    stages {
        stage('CLONE GIT') {
            steps {
                git url: 'https://github.com/buithikieu/jenkins-github.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    bat "docker build -t %DOCKER_IMAGE% ."
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Đăng nhập Docker Hub
                        bat "docker push %DOCKER_IMAGE%"
                    }
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                    // Pull Docker image từ Docker Hub
                    bat "docker pull %DOCKER_IMAGE%"
                    // Dừng container đang chạy (nếu có) và xóa nó
                    bat "docker stop my-app || echo Container not running && docker rm my-app || echo No container to remove"
                    // Chạy container từ image mới nhất
                    bat "docker run -d --name my-app -p 5000:5000 %DOCKER_IMAGE%"
                }
            }
        }
    }
}
