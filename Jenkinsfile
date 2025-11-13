pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'master', url: 'https://github.com/arsalan9997/boot-war-file.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // ✅ Create Dockerfile dynamically
                    writeFile file: 'Dockerfile', text: '''
FROM eclipse-temurin:21-jdk
COPY BootJSP.war app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]
'''

                    // ✅ Build Docker image
                    sh 'docker build -t bootjsp-app:latest .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop old container if running
                    sh 'docker rm -f bootjsp-app || true'
                    
                    // Run new container on port 9090
                    sh 'docker run -d --name bootjsp-app -p 8080:8080 bootjsp-app:latest'
                }
            }
        }
    }
}
