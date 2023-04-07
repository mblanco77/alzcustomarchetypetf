# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "alz-tf1"
}

variable "root_name" {
  type    = string
  default = "alz tf1"
}

variable "connectivity_resources_location" {
  type    = string
  default = "eastus"
}

variable "primary_location" {
  type = string
  default = "eastus"
}
