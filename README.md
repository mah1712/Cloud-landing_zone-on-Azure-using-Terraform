# Cloud Landing Zone on Azure using Terraform

## Description
This project sets up a Cloud Landing Zone on Microsoft Azure using Terraform.  
It automates the creation of core infrastructure components and follows best practices for IaC (Infrastructure as Code).

## Project Structure
project_root/
│
├── environment/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars
│   │   └── variable.tf
│   │
│   ├── prod/
│       ├── main.tf
│       ├── provider.tf
│       ├── terraform.tfvars
│       └── variable.tf
│
├── module/
├── README.md
└── .gitignore


## Prerequisites
- Terraform installed (v1.x or above)
- Azure CLI installed
- Azure subscription
- Git installed
## Prerequisites
- Terraform installed (v1.x or above)
- Azure CLI installed
- Azure subscription
- Git installed

## How to Use
1. Clone this repository:
```bash
git clone https://github.com/mah1712/Cloud-landing_zone-on-Azure-using-Terraform.git

2. Navigate to the project folder:
cd (clone folder name)

3 Initialize Terraform: #make sure your sucscription ID edit
terraform init

4. Plan the deployment: #need to login in Azure
terraform plan

5. Apply the deployment:
terraform apply

