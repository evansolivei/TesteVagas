# Default Region
variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

# Tipo da AMI que será utilizada para as EC2
variable "ami" {
  description = "AMI"
  default     = "ami-xxxxvagas" // Amazon Linux
}

# Classe da instância que será utilizada
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "vpc_cidr" {
    description = "CIDR teste Vagas VPC"
    default = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
    description = "CIDR teste Vagas Private Subnet"
    default = "10.0.1.0/24"
}

