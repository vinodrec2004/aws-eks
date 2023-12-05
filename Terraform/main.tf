terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "kids-mcds"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "backstage-eks-aws"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  # Additional provider configuration...
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.20.0"

  region               = "us-east-1"
  cluster_version      = "1.27"
  cluster_name         = "my_eks_cluster"
  instance_types       = ["t2.small"]
  vpc_cidr             = "10.0.0.0/16"
  cluster_min_size     = 1
  cluster_max_size     = 3
  cluster_desired_size = 2
}
