variable "automation_connection_service_principals" {
  description = <<EOT
Map of automation_connection_service_principals, attributes below
Required:
    - application_id
    - automation_account_name
    - certificate_thumbprint
    - name
    - resource_group_name
    - subscription_id
    - tenant_id
Optional:
    - description
EOT

  type = map(object({
    application_id          = string
    automation_account_name = string
    certificate_thumbprint  = string
    name                    = string
    resource_group_name     = string
    subscription_id         = string
    tenant_id               = string
    description             = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_service_principals : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_service_principals : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_service_principals : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_service_principals : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.application_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_service_principals : (
        length(v.certificate_thumbprint) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_service_principals : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.subscription_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_connection_service_principals : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.tenant_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

