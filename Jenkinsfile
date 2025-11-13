pipeline {
    agent any

    environment {
        APP_NAME = "bootjsp-app"
        DOCKER_IMAGE = "bootjsp-app:latest"
        GIT_REPO = "https://github.com/arsalan9997/boot-war-file.git"
    }

    stages {

        stage('Clone from GitHub') {
            steps {
                echo "📥 Cloning repository..."
                git branch: 'main', url: "${GIT_REPO}"
            }
        }

        stage('Verify WAR File') {
            steps {
                echo "🔍 Checking WAR file..."
                sh 'ls -l BootJSP.war || (echo "BootJSP.war file not found!" && exit 1)'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image..."
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Deploy Docker Container') {
            steps {
                echo "🚀 Deploying container..."
                sh '''
                docker rm -f $APP_NAME || true
                docker run -d --name $APP_NAME -p 8080:8080 $DOCKER_IMAGE
                '''
            }
        }
    }
}
