pipeline {
    agent any

    environment {
        APP_NAME = "java-war-app"
        DOCKER_IMAGE = "java-war-app:latest"
        GIT_REPO = "https://github.com/your-username/your-repo.git" // 👉 apna repo URL daalo
    }

    stages {

        stage('Clone from GitHub') {
            steps {
                echo "📥 Cloning repository..."
                git branch: 'master', url: "${GIT_REPO}"
            }
        }

        stage('Verify WAR File') {
            steps {
                echo "🔍 Checking WAR file..."
                sh 'ls -l *.war || (echo "WAR file not found!" && exit 1)'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image..."
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Run Docker Container') {
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
