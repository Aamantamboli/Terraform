# Terraform Workspace Setup: Dev, Test, and Prod

This repository contains Terraform configurations for managing infrastructure in different environments: `dev`, `test`, and `prod`.

Terraform workspaces allow us to manage separate states for different environments while using the same codebase. This setup is designed to help you switch between environments and deploy infrastructure in a consistent and isolated way.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) version 1.0 or higher.
- A cloud provider account (e.g., AWS, Azure, GCP) and configured CLI tools.
- Terraform provider credentials and API keys should be set up in your environment.

## Workspace Setup

Terraform workspaces allow you to isolate the state of resources between different environments. We will use the following workspaces:

- `dev` - Development environment
- `test` - Testing environment
- `prod` - Production environment

To use this setup, you need to create and switch between workspaces.

### Initialize the workspace

Before you start, ensure that Terraform is initialized in your workspace:

```bash
terraform init
```

This will download any necessary provider plugins and set up the backend for the configuration.

### List Terraform Workspaces

To see the available workspaces and check which one you are currently in, run:

```bash
terraform workspace list
```

This will show you the current workspace and any existing workspaces.

### Create a New Workspace

To create a new workspace, use the following command:

```bash
terraform workspace new <workspace_name>
```

For example, to create a workspace for `dev`:

```bash
terraform workspace new dev
```

Repeat this for `test` and `prod` if they do not already exist.

### Switch Between Workspaces

To switch between workspaces, use the following command:

```bash
terraform workspace select <workspace_name>
```

For example, to switch to `prod`:

```bash
terraform workspace select prod
```

### Environment-Specific Configurations

In each workspace, you may want to use different variables or configurations. You can achieve this by using `terraform.tfvars` files or setting environment variables.

#### Example Variable Files

- `dev.tfvars`: Contains variables specific to the development environment.
- `test.tfvars`: Contains variables specific to the testing environment.
- `prod.tfvars`: Contains variables specific to the production environment.

You can apply Terraform configurations for a specific workspace by passing the appropriate variable file:

```bash
terraform apply -var-file="dev.tfvars"
terraform apply -var-file="test.tfvars"
terraform apply -var-file="prod.tfvars"
```

Alternatively, you can use environment variables or other dynamic mechanisms to manage environment-specific variables.

### Backend Configuration

It’s a best practice to use remote backends like AWS S3, Azure Blob Storage, or HashiCorp Consul to store the Terraform state for each workspace. This ensures that your state is managed securely and consistently.

### Example of `backend.tf` for S3 (AWS)

```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "state/${terraform.workspace}.tfstate"
    region = "us-east-1"
  }
}
```

With this setup, the state will be stored separately for each workspace in a different file (e.g., `state/dev.tfstate`, `state/test.tfstate`, etc.).

### Working with Different Environments

- **Development (`dev`)**: This workspace should contain resources for testing and experimentation.
- **Testing (`test`)**: This workspace should be used to deploy resources for integration and QA testing.
- **Production (`prod`)**: This workspace contains production-level resources that need to be stable and highly available.

### Applying Changes

To apply changes in a specific workspace, simply run the `terraform apply` command after selecting the workspace:

```bash
terraform workspace select dev
terraform apply -var-file="dev.tfvars"

terraform workspace select test
terraform apply -var-file="test.tfvars"

terraform workspace select prod
terraform apply -var-file="prod.tfvars"
```

### Destroy Resources

To destroy all resources for a specific environment (workspace), use the following command:

```bash
terraform workspace select dev
terraform destroy -var-file="dev.tfvars"

terraform workspace select test
terraform destroy -var-file="test.tfvars"

terraform workspace select prod
terraform destroy -var-file="prod.tfvars"
```

### Managing Variables

You can define environment-specific variables in `.tfvars` files or via command-line options. For example, you might define an AWS region as a variable:

#### `variables.tf`

```hcl
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "instance_type" {
  description = "The instance type for EC2"
  type        = string
}
```

Then in `dev.tfvars`, `test.tfvars`, and `prod.tfvars`, you can define the values for these variables:

#### `dev.tfvars`

```hcl
aws_region    = "us-west-2"
instance_type = "t2.micro"
```

#### `test.tfvars`

```hcl
aws_region    = "us-east-1"
instance_type = "t2.small"
```

#### `prod.tfvars`

```hcl
aws_region    = "us-east-2"
instance_type = "t2.large"
```

## Best Practices

- Use separate state files for each environment.
- Protect production workspaces by limiting access.
- Use version-controlled `.tfvars` files to manage environment-specific values securely.
- Plan your infrastructure changes using `terraform plan` before applying them.
- Use remote backends (e.g., S3, GCS) for state management.
- Store sensitive data (e.g., API keys, credentials) using environment variables or secrets management tools.

---

By following this workspace setup, you can easily manage infrastructure across different environments and keep your Terraform configurations modular and maintainable.


### Key Points:
- The `README.md` outlines how to use Terraform workspaces for managing multiple environments (dev, test, prod).
- Instructions include setting up and switching between workspaces, using environment-specific variable files, and best practices for managing Terraform state.
- It assumes the use of `.tfvars` files for each environment and provides a basic structure for a `backend.tf` configuration.
