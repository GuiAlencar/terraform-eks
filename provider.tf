terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.18.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.8.0"
    }
  }
  # como a ideia é usar modulos remotos não podemos deixar esse backend aqui, porque ele será baixado por outras pessoas que usarao seu proprio remote state
  backend "s3" {
    bucket = "comunidadedevops"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = module.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster.certificate_authority)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", module.eks_cluster.cluster_name]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes = {
    host                   = module.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster.certificate_authority)
    exec = {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", module.eks_cluster.cluster_name]
      command     = "aws"
    }
  }
}