# Use a smaller base image for running the application
FROM openjdk:11-jre-slim

# Set the working directory for the runtime
WORKDIR /app

# Copy the existing WAR file into the container
COPY myweb.war app.war

# Expose the port on which the application will run
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.war"]



FROM tomcat:8
COPY target/*.war /usr/local/tomcat/webapps/myweb.war 
