terraform {
  cloud {
    organization = "idp_bs"

    workspaces {
      name = "test-terraform"
    }
  }
}

module "eks" {
  source  = "./modules/terraform-aws-eks"

  region               = "eu-central-1"
  cluster_version      = "1.27"
  cluster_name         = "idp"
  instance_types       = ["t2.small"]
  vpc_cidr             = "10.0.0.0/16"
  cluster_min_size     = 1
  cluster_max_size     = 3
  cluster_desired_size = 2
}
