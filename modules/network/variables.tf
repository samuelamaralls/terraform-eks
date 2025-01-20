variable "cidr_block" {
  type        = string
  description = "Networkind CIDR block VPC"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}

variable "vpc_id" {
  type = string
}