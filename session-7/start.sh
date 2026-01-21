#! /bin/bash


rm -rf .terraform*

ENV=$1

if [ -z "$ENV" ]; then 
    echo "Usage: $0 <env>" 
    exit 1
fi 

sed -i '' "s/_env_/$ENV/g" backend.tf

echo "Environemtn set to $ENV"

terraform init 
terraform apply -var-file=$ENV.tfvars --auto-approve

sed -i '' "s/$ENV/_env_/g" backend.tf

