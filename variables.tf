//Resources///////////////////////////////////////////////////////
variable "instance-type" {
  type    = string
  default = "t3.micro"
}
variable "instance-type-list" {
  type    = list(string)
  default = ["t3.micro", "t3.small", "t3.large"]
}
variable "instance-type-map" {
  type = map(string)
  default = {
    "dev"  = "t3.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}

variable "key-pair" {
  default = "lupfumo-key-mumbai"
}

///VPC Modules ///////////////////////////////////////////////////////////////////////////
variable "vpc_name" {
  type    = string
  default = "project-lzb"
}

variable "vpc_cidr_block" {
  type    = string
  default = "20.0.0.0/16"
}

variable "vpc_availability_zones" {
  type    = list(string)
  default = ["eu-west-1a", "eu-west-1b"]
}

variable "vpc_public_subnets" {
  type    = list(string)
  default = ["20.0.10.0/24", "20.0.11.0/24"]
}

variable "vpc_private_subnets" {
  type    = list(string)
  default = ["20.0.20.0/24", "20.0.21.0/24"]
}

variable "vpc_database_subnets" {
  type    = list(string)
  default = ["20.0.30.0/24", "20.0.31.0/24"]
}

variable "vpc_create_database_subnet_group" {
  type    = bool
  default = false
}

variable "vpc_create_database_subnet_route_table" {
  type    = bool
  default = false
}

variable "vpc_enable_nat_gateway" {
  type    = bool
  default = false
}

variable "vpc_single_nat_gateway" {
  type    = bool
  default = false
}

/////////EKS//////////////////////////////////////////////////
variable "eks-cluster" {
  type    = string
  default = "eks-lzb"
}

variable "eks-cluster-Version" {
  type    = string
  default = null
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}
//////generic/////////////////////////////
variable "aws-region" {
  default = "ap-south-1"
}

variable "environment" {
  type    = string
  default = "Development"
}

variable "business-division" {
  type    = string
  default = "IT"
}