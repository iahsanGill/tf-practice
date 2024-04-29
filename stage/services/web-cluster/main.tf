provider "aws" {
  region = "us-east-2"
}

module "web-cluster" {
  source = "../../../modules/services/web-cluster"

  cluster_name  = "example-cluster"
  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 2
}
