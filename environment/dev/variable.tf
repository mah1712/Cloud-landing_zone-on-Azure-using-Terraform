variable "azurerm_resource_group" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
    }
  ))
}

variable "vnets" {
  type = map(object(
    {
      name                = string
      location            = string
      resource_group_name = string
      address_space       = list(string)
      subnet = optional(map(object({
        name             = string
        address_prefixes = list(string)
        }
    ))) }
  ))

}

variable "pips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = optional(map(string))
  }
  ))
}
variable "nic" {
  
}

variable "subnet_data" {
  
}
variable "vm" {
  
}
variable "nic_data" {
  
}
variable "data_kv" {
  
}
