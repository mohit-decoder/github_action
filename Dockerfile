# Use a Maven image to build the project
FROM ubuntu:20.04 AS builder

# Set the working directory in the builder stage
WORKDIR /app

COPY data.sh .

RUN chmod 777 data.sh && sh data.sh

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use a distroless image for running the application
FROM ubuntu:20.04

RUN mkdir -p /opt/tomcat

COPY install.sh .

RUN chmod 777 install.sh && sh install.sh

RUN mv apache-tomcat-10.1.26/* /opt/tomcat && mv mysql-connector.jar /opt/tomcat/lib

# Set the working directory in the distroless image
WORKDIR /opt/tomcat

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/*.war /opt/tomcat/webapps/

# Run the application
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
