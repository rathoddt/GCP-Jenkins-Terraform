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