# Use Tomcat 9 with Java 23
FROM tomcat:9-jdk21

# Remove default Tomcat ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file and rename it to ROOT.war
COPY BootJSP.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
