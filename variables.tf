variable "aws_region" {
    description = "AWS Region to deploy API Gateway REST API"
    type        = string
    default     = "eu-west-2"
}

variable "rest_api_domain_name" {
    description = "Domain name for API Gateway cert"
    type        = string
    default     = "example-test.tech"
}
variable "rest_api_name" {
    description = "Name of API Gateway Rest API"
    type        = string
    default     = "test-api"
  
}

variable "rest_api_path_1" { 
    description = "Path to create in REST API (can triggered redeployments)"
    type        = string
    default     = "/path1"
}

variable "rest_api_path_2" { 
    description = "Path to create in REST API (can triggered redeployments)"
    type        = string
    default     = "/path2"
}

variable "stage_name_1" {
     description = "Name of stage 1"
     type        = string
     default     = "dev"
}

variable "stage_name_2" {
     description = "Name of stage 1"
     type        = string
     default     = "prod"
}

variable "bool" {
    description = "Boolean true or false"
    type        = bool
    default     = true
}
