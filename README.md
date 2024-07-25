CI/CD with GitHub Actions and Docker
------------------------------------
This repository demonstrates how to set up a Continuous Integration (CI) and Continuous Deployment (CD) pipeline using GitHub Actions to build and push Docker images to Docker Hub. The project uses a Java application built with Maven and deployed in a Docker container running Tomcat.

Table of Contents
-----------------
-  Overview
-  Prerequisites
-  GitHub Actions Workflow
-  Common Issues
-  Debugging Tips

Overview
-----------
This project is designed to demonstrate the following:

1.  Building a Java Application: Using Maven to compile and test a Java application.
2.  Containerizing the Application: Using Docker to package the application into a container.
3.  Deploying with GitHub Actions: Automating the build and deployment process with GitHub Actions.
4.  Publishing to Docker Hub: Automatically pushing the built Docker image to Docker Hub.

Prerequisites
-------------
Before you begin, ensure you have the following:

A GitHub account.
A Docker Hub account.
Docker installed on your local machine.
Basic understanding of Docker, GitHub Actions, and CI/CD concepts.

GitHub Actions Workflow
-----------------------
Here is the GitHub Actions workflow (.github/workflows/ci.yaml) used in this project.

Workflow Explanation:
-  Triggers:

The workflow is triggered on any push to the main branch, except changes to Readme.md.
-  Build Job:

  Check out the repository: Uses the actions/checkout@v4 to clone the repository to the GitHub runner.
  Set up Java: Configures the Java environment using the actions/setup-java@v4.
  Build and compile: Runs mvn clean compile to build the Java application.
  Test: Runs mvn test to execute the test cases.

- Docker Job:

  Needs Build: This job depends on the successful completion of the build job.
  Setup Docker Buildx: Configures Docker Buildx for building images.
  Login to Docker Hub: Authenticates to Docker Hub using secrets.
  Build and Push Image: Builds the Docker image and pushes it to Docker Hub using docker/build-push-action@v5.

-  Secrets Configuration

  Make sure to set the following secrets in your GitHub repository:
  
  DOCKER_USERNAME: Your Docker Hub username.
  DOCKER_TOKEN: Your Docker Hub access token.
  DOCKER_HUB_USERNAME: Your Docker Hub username again (used in the image tag).

Running Locally
---------------
To run this project locally, follow these steps:

Clone the Repository:
  '''git clone https://github.com/mohit-decoder/github_action.git'''
    "cd github_action"
