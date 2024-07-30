# Terraform

## Installation
CentOS-09  
---------  
URL: `https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli`

```
#Install yum-config-manager to manage your repositories.
sudo yum install -y yum-utils

#Use yum-config-manager to add the official HashiCorp Linux repository.
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

sudo yum -y install terraform
terraform --help
terraform --help plan
```


Importing existing resource]
```
terraform import google_cloud_run_v2_service.run-v2 serverless-gcp-391314/asia-southeast1/cloudrun-v2
```