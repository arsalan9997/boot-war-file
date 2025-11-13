writeFile file: 'Dockerfile', text: '''
FROM eclipse-temurin:21-jdk
COPY target/BootJSP.war app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]
'''
