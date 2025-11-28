variable "salt" {
  description = "Optional salt for use in the name"
  default     = ""
  type        = string
}

variable "location" {
  description = "Default location to use if not specified"
  default     = "eastus"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  default     = "mcpchat"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  default     = "dev"
  type        = string
}
