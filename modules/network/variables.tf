variable "cidr_block" {
  type = string
  description = "Networking CIDR block to be used for the VPC"
}

variable "project_name" {
  type = string 
  description = "Project name to be used to name the resources (Name tag)"
}

variable "tags" {
  type = map 
  description = "Tags to be added to AWS resources"
}

# QUANDO NÃO ESTAMOS USANDO O ARQUIVO terraform.tfvars
# terraform plan
# quando executar o comando acima vai pedir o valor da variável cidr_block é só colocar no terminal
# 10.0.0.0/16