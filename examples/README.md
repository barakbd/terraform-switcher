# Example Terraform configuration for testing docker

docker build -t tfswitch:scratch .
docker run --rm -v terraform-v1.0.0:/terraform tfswitch:scratch terraform fmt -recursive --check terraform
