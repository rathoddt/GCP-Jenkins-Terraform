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

Manual installation
```
1 Download
wget https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_linux_386.zip

echo $PATH
mv ~/Downloads/terraform /usr/local/bin/
```


Importing existing resource]
```
terraform import google_cloud_run_v2_service.run-v2 serverless-gcp-391314/asia-southeast1/cloudrun-v2
```