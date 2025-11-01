variable "vnet" {
  type = map(object(
    {
      name                = string
      location            = string
      resource_group_name = string
      address_space       = list(string)
      subnet = optional(map(object({
        name = string
        address_prefixes = list(string)
      }
  )))}
  ))


}
