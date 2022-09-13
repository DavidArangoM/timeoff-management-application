
# Timeoff-app - Terraform

This project is using Terraform as IaC to build and deploy the infrastructure


## Requirements

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [AWS cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [AWS credentials](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html)
- [S3 bucket as backend](https://www.terraform.io/language/settings/backends/s3)
- [Dynamo table as state locking](https://www.terraform.io/language/settings/backends/s3)



## Folder structure

This Terraform project is using Terraform modules to reuse code and make more understandable its execution.

The folder structure is composed by:

* Main folder
  * main.tf - Contain the main logic to call each module
  * variables.tf - Contain the variables definition
  * var-values.tf - Contain harcoded values
* Modules folder
  *  Service category
      * main.tf - Contain the module logic
      * variables.tf - Contain the variables definition
## Run Locally

Clone the project

```bash
  git clone https://github.com/DavidArangoM/timeoff-management-application
```

Go to the project directory

```bash
  cd terraform/main
```

Initialize terraform

```bash
  terraform init
  terraform init --reconfigure (when you add or delete some module)
```

Check plan

```bash
  terraform plan -var-file ./var-values.tfvars
```

Apply infrastructure

```bash
  terraform apply -var-file ./var-values.tfvars
```

Destroy infrastructure

```bash
  terraform apply -var-file ./var-values.tfvars
```

Execute commands on specific module

```bash
  terraform plan -var-file ./var-values.tfvars -target=module.vpc
  terraform apply -var-file ./var-values.tfvars -target=module.vpc
  terraform destroy -var-file ./var-values.tfvars -target=module.vpc
```

