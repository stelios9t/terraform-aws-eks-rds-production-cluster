# AWS Secrets Manager - RDS Integration

### Setting up AWS Secrets Manager as a secure vault to store RDS DB Password

```bash
aws secretsmanager create-secret \
  --name rds-db-password \
  --secret-string "<password>"
```

> Creates secret resource
