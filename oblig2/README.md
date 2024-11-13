




Når du kjører terraform apply kan du velge hvilket workspace du vil arbeide i med kommandoene under.

terraform apply -var-file="terraform.tfvars.dev"
terraform apply -var-file="terraform.tfvars.prod"
terraform apply -var-file="terraform.tfvars.staging"
