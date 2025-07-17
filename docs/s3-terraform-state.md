# Terrafom State locked in S3 bucket with DynamoDB lock

Below commands configure resources needed for S3 state locking using AWS CLI

```bash
aws s3api create-bucket \
  --bucket eks-rds-project-bucket \
  --region eu-central-1
```

> To create S3 bucket

```bash
aws s3api put-bucket-versioning \
  --bucket eks-rds-project-bucket \
  --versioning-configuration Status=Enabled
```

> Enables versioning

```bash
aws dynamodb create-table \
  --table-name terraform-lock-table \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1
```

> Creates DynamoDB table for state locking so that only one person can write to terraform state at the same time
