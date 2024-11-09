# <div align="center"> Terraform </div>
<p align="center">
  <img src="https://github.com/user-attachments/assets/72fefadd-7363-4f36-aa1a-ed972f642d36"/>
</p>

## What is Terraform?
Terraform is an open-source infrastructure as code (IaC) tool created by HashiCorp. It allows you to define, provision, and manage cloud infrastructure using a high-level configuration language called HashiCorp Configuration Language (HCL) or JSON.
With Terraform, you can describe your infrastructure components—such as virtual machines, networks, storage, and databases—as code. This enables version control, collaboration, automation, and reproducibility in infrastructure management. Terraform works with a wide range of cloud service providers (such as AWS, Azure, Google Cloud, and many others) as well as other platforms like Kubernetes, VMware, and even on-premises solutions.

## Why use Terraform?
### 1. Automate Changes
With Terraform, the need to write instructions step-by-step for creating resources is eradicated as it can manage the essential logic. Moreover, the configuration files in Terraform are declarative, which defines the end state of the infrastructure. All these factors allow Terraform users to automate changes.
### 2. Infrastructure Management
Undeniably, Terraform or any other IaC tool can help you manage a provider\’s IT infrastructure. However, Terraform can work with not just a single provider but multiple cloud providers simultaneously. With this tool, you can write your custom registry and manage the platform and services you use.
### 3. Configuration Standardization
Terraform supports modules which are reusable configuration components that describe the configurable collections of your infrastructure. Not only do they promote the correct practices, but they save crucial time as well. Another excellent thing about this tool is that you can customize these modules or even use publicly available ones.
### 4. Infrastructure Tracking
With this tool, you can create a plan and always seek permission before making any infrastructure alteration. Furthermore, it monitors the infrastructure in a state file. By using this file, this tool can identify the necessary modifications to make in the existing infrastructure to meet the set configurations.
## Architecture of Terraform

![image](https://github.com/user-attachments/assets/0adb4c55-b60d-4cd4-9700-58f74522bee6)

## Key Features of Terraform
### 1. Infrastructure as Code (IaC)
You define infrastructure resources in code, which can be stored in version control systems (e.g., Git). This makes infrastructure more consistent, repeatable, and auditable.
### 2. Declarative Configuration
You specify what the desired state of the infrastructure should be, and Terraform automatically determines how to achieve that state, creating or modifying resources as necessary.
### 3. State Management
Terraform maintains a state file that tracks the current configuration of the infrastructure. This allows Terraform to compare the actual infrastructure with your desired configuration, and apply only the changes needed.
### 4. Execution Plans
Terraform generates an execution plan before applying changes. This allows you to preview what changes will occur and helps prevent accidental modifications to your infrastructure.
### 5. Multi-Provider Support
Terraform can work across multiple cloud providers and services. You can provision infrastructure across AWS, Google Cloud, Azure, and even on-premise systems using the same tool and workflow.
### 6. Modules 
Terraform allows you to create reusable modules, which are collections of Terraform resources and configurations. This enables you to build standardized, repeatable infrastructure patterns that can be shared across different projects or teams.
### 7. Extensible
Terraform supports plugins that allow users to manage a variety of infrastructure types, including cloud resources, on-premise resources, DNS, SaaS, and more.

## Lifecycle of Terraform
The lifecycle of Terraform involves a series of stages or steps that govern how it interacts with your infrastructure to create, update, or destroy resources. This lifecycle is centered around the `terraform` commands and the `terraform state` file, and it can be broken down into several key phases:

### 1. **Write Configuration (Definition Phase)**
   - **Purpose:** You define your infrastructure as code in Terraform configuration files, usually with a `.tf` or `.tf.json` extension.
   - **What Happens:** You write declarative code using **HashiCorp Configuration Language (HCL)** to specify what resources you want to create and manage (e.g., virtual machines, networks, storage, databases).
   - **Files:** You create one or more `.tf` files containing the resource definitions. These files define providers (e.g., AWS, Azure, Google Cloud) and the infrastructure resources you want to manage.
   
   **Example:**
   ```hcl
   provider "aws" {
     region = "us-west-2"
   }

   resource "aws_instance" "example" {
     ami           = "ami-0c55b159cbfafe1f0"
     instance_type = "t2.micro"
   }
   ```

### 2. **Initialize Terraform (Initialization Phase)**
   - **Purpose:** Prepare your working directory by installing necessary plugins and providers.
   - **What Happens:** When you run `terraform init`, Terraform:
     - Downloads the required provider plugins (e.g., AWS, Azure, Google Cloud, etc.).
     - Initializes the working directory and prepares it for subsequent operations.
     - Creates a `.terraform` directory that stores downloaded provider plugins and other initialization files.
   
   **Command:**
   ```bash
   terraform init
   ```

### 3. **Plan (Execution Plan Phase)**
   - **Purpose:** Preview the changes Terraform will make to your infrastructure.
   - **What Happens:** When you run `terraform plan`, Terraform:
     - Reads the configuration files to understand the desired state of your infrastructure.
     - Compares the current state of your infrastructure (stored in the Terraform state file) to the desired state defined in the configuration.
     - Generates a plan that shows what resources will be created, modified, or destroyed.
     - Outputs a summary of the planned actions, but does not make any actual changes to the infrastructure.
   
   **Command:**
   ```bash
   terraform plan
   ```

   **Output Example:**
   ```bash
   + resource "aws_instance" "example" {
       ami           = "ami-0c55b159cbfafe1f0"
       instance_type = "t2.micro"
     }
   ```

### 4. **Apply (Apply Changes Phase)**
   - **Purpose:** Apply the planned changes to your infrastructure.
   - **What Happens:** When you run `terraform apply`, Terraform:
     - Executes the plan that was generated during the `terraform plan` step (or generates a new plan if needed).
     - Applies the necessary changes to your infrastructure based on the defined configuration.
     - Modifies the state file to reflect the updated state of your infrastructure.
   
   **Command:**
   ```bash
   terraform apply
   ```
   - Terraform will prompt you to confirm the plan (unless you use the `-auto-approve` flag to skip confirmation).
   
   **Example Output:**
   ```bash
   aws_instance.example: Creating...
   aws_instance.example: Creation complete after 3s [id=i-0abcd1234efgh5678]
   ```

### 5. **State Management (State File)**
   - **Purpose:** Track and persist the state of your infrastructure.
   - **What Happens:** Terraform maintains a **state file** (typically `terraform.tfstate`) to track the current state of your infrastructure. The state file allows Terraform to know what resources already exist, what has changed, and what actions need to be taken when applying updates.
     - **Remote State:** You can also configure remote state backends (like S3, Consul, or Terraform Cloud) to store the state file outside of your local machine for team collaboration.
   
   **State File Example:**
   ```json
   {
     "version": 4,
     "terraform_version": "1.3.0",
     "resources": [
       {
         "type": "aws_instance",
         "name": "example",
         "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
         "instances": [
           {
             "schema_version": 1,
             "attributes": {
               "ami": "ami-0c55b159cbfafe1f0",
               "instance_type": "t2.micro",
               "id": "i-0abcd1234efgh5678"
             }
           }
         ]
       }
     ]
   }
   ```

### 6. **Modify Infrastructure (Update Phase)**
   - **Purpose:** Modify or update existing infrastructure resources.
   - **What Happens:** When you change your `.tf` files (e.g., change instance types, add new resources), Terraform will:
     - Perform a new `terraform plan` to compute what changes are necessary to reconcile the current state with the desired state.
     - Generate an updated execution plan and display the changes that will be made.
     - Use `terraform apply` to update the infrastructure.
   
   **Example:**
   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-0c55b159cbfafe1f0"
     instance_type = "t2.medium"  # Changed from t2.micro
   }
   ```

### 7. **Destroy (Clean-up Phase)**
   - **Purpose:** Clean up and remove infrastructure.
   - **What Happens:** When you run `terraform destroy`, Terraform:
     - Destroys all the resources that were managed by Terraform.
     - Modifies the state file to reflect the changes, ensuring Terraform is aware of the removal of the resources.
   
   **Command:**
   ```bash
   terraform destroy
   ```

   **Example Output:**
   ```bash
   aws_instance.example: Destroying...
   aws_instance.example: Destruction complete after 2s
   ```

### 8. **Destroying Resources (Final Cleanup)**
   - **Purpose:** Optionally remove all infrastructure and clean up Terraform-managed resources.
   - **What Happens:** This phase ensures that resources are correctly deleted and the state is updated to reflect their removal. It is often used at the end of a project or when cleaning up resources to avoid unnecessary costs.

---

### Terraform Lifecycle Diagram

```
+------------------+        +---------------+         +----------------+ 
|  Write Config    | ---->  | Initialize    | ---->   |  Plan Changes  |
|  (Define         |        |  (terraform    |         |  (terraform    |
|  Infrastructure) |        |   init)        |         |   plan)        |
+------------------+        +---------------+         +----------------+
                                                        |
                                                        v
                                                +----------------+
                                                |   Apply Changes|
                                                |  (terraform    |
                                                |   apply)       |
                                                +----------------+
                                                        |
                                                        v
                                                +-----------------+
                                                |  Manage State   |
                                                |  (terraform     |
                                                |   state)        |
                                                +-----------------+
                                                        |
                                                        v
                                                +-----------------+
                                                |   Destroy       |
                                                |  (terraform     |
                                                |   destroy)      |
                                                +-----------------+
```

---

### Conclusion:
The lifecycle of Terraform revolves around defining infrastructure, initializing the environment, planning changes, applying changes, tracking state, and optionally destroying resources when they are no longer needed. By following this lifecycle, teams can effectively manage and automate their infrastructure, ensuring consistency, repeatability, and efficiency in the deployment and management process.
