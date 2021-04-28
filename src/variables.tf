variable "prefix" {
  type = string
  default = "gabo"
}

variable "eshop_plan_sku" {
  type = object({
    tier = string
    size = string
  })
  description = "Service plan SKU"
  default = {
    tier = "Standard"
    size = "S1"
  }
}
