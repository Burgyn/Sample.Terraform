variable "prefix" {
  type = string
  default = "gabo"
}

variable "application_name" {
  type        = string
  description = "Application name. Example: base-app."
}

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = "Resource group."
}

variable "default_app_service_plan_id" {
  type        = string
  description = "Default service plan id."
}

variable "sql_server" {
  type = object({
    id                           = string,
    name                         = string,
    administrator_login          = string,
    administrator_login_password = string
  })
  description = "SQL server."
}

variable "services" {
  type = map(object({
    name                = string
    create_database     = bool
    app_service_plan_id = string
  }))
  description = "Services definitions."
}

variable "key_vault" {
  type = object({
    id  = string
  })
}

variable "app_depends_on" {
  type        = any
  default     = null
  description = "A list of resources on which it is dependent."
}