# GCP-Jenkins-Terraform

Create Service account to be used with terraform

Enable <i> Cloud Resource Manager API</i> also <i> Compute Engine API</i>

```
gcloud auth list
gcloud auth login `ACCOUNT`
gcloud auth application-default login
```

# Clean up

```
terraform destroy
rm -rf ../01-VPC/.terraform*
rm -rf ../01-VPC/terraform.tfstate*
```

## Top level blocks
- resource
- provider
- terraform
- variable
- data
- module
- output

## Terraform states
Desired states  - the state defined in terraform files
Current state - the state of resouces deployed in the target env, e.g. GCP cloud. Its reference is contained in `terrraform.tfstate` file

### Terraform variable precedence
# Variable Precendence
- Priority-1: Any -var and -var-file options on the command line, in the order they are provided. 
- Priority-2: Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
- Priority-3: The terraform.tfvars.json file, if present.
- Priority-4: The terraform.tfvars file, if present.
- Priority-5: Environment variables
- Priority-6: variables.tf


## Instance Group
Group of VM instances managed as single entity

## Backend
Google Cloud service that receives traffic from load balancer. e.g
- Instance group
- Cloud Run
- App Engine
- GKE
- Cloud storage
- Clouf Function
- Backend external to GCP

