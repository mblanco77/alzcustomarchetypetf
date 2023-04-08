# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "alz-tf1"
}

variable "root_name" {
  type    = string
  default = "alz tf1"
}

variable "primary_location" {
  type = string
  default = "eastus"
}
