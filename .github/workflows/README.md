
# Timeoff-app - GitHub Actions

This project is using a CI-CD flow based on GitHub actions


## Documentation

****CI FLOW****

**Trigger:** pull_request

**Branch:** master

| Step | Description |
| ------ | ------ |
| Pull source code | Get the source code to be compiled and tested |
| Setup node | Install node libraries in the GitHub agent |
| Build app | Verify the app build command |
| Run tests | Run app tests (This step was comented due to continuous fails) |
| Check Docker image | Build the docker image to identify any issue in the generation |

****CD FLOW****

**Trigger:** push

**Branch:** master

| Step | Description |
| ------ | ------ |
| Configure aws credentials | Setup credentials to login into ECR repo |
| Login to ECR repository | Get token |
| Build Docker image | Build app and nginx images |
| Tag Docker image | Tag the previous images |
| Push Docker image to ECR | Update the images in ECR repo |
| Deploy changes | Update ECS service forcing a new deployment |