variable "project_name" {
  type = string 
  description = "Project name to be used to name the resources (Name tag)"
}

variable "tags" {
  type = map 
  description = "Tags to be added to AWS resources"
}

variable "oidc" {
  type = string
  description = "HTTPS URL for the OIDC provider for the EKS cluster"
}

variable "cluster_name" {
  type = string
  description = "EKS Cluster name"
}