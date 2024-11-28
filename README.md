
# Inventory for Lambda Deployment

## Create S3 Bucket

```
aws s3api create-bucket --bucket inventory-lambda-terraform-state-bucket --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2

```

## Run

```
terraform init -backend-config="backend-dev.hcl"
```

## TODO

Modulize the project