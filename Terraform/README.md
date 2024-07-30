# Terraform

## Installation
CentOS-09  
---------  
### 1) Terraform installation
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

### 2) Gcloud SDK setup
```
wget https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_linux_386.zip
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

cat /etc/yum.repos.d/google-cloud-sdk.repo
sudo dnf install libxcrypt-compat.x86_64
sudo dnf install google-cloud-cli
```

Importing existing resource]
```
terraform import google_cloud_run_v2_service.run-v2 serverless-gcp-391314/asia-southeast1/cloudrun-v2
```