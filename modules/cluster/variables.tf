variable "project_name" {
  type = string 
  description = "Project name to be used to name the resources (Name tag)"
}

variable "tags" {
  type = map 
  description = "Tags to be added to AWS resources"
}

variable "public_subnet_1a" {
  type = string 
  description = "ID of the public subnet in availability zone 1a"
}

variable "public_subnet_1b" {
  type = string 
  description = "ID of the public subnet in availability zone 1b"
}