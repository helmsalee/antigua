# Save Terraform State to GCP Storage
terraform {
  backend "gcs" {
    bucket  = "antigua-5140-terraform-backend"
    prefix  = "terraform.tfstate"
  }
}