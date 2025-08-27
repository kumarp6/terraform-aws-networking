variable "vpc_config" {
  description = "Configuration for the VPC to be created."
  type = object({
    name       = string
    cidr_block = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The cidr_block config attribute in vpc_config must contain a valid CIDR block."
  }
}

variable "subnet_config" {
  description = "Configuration for the subnets to be created within the VPC."
  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  }))

  validation {
    condition     = alltrue([for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))])
    error_message = "The cidr_block config attribute in vpc_config must contain a valid CIDR block."
  }
}
