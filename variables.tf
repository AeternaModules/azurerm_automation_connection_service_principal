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
  # --- Unconfirmed validation candidates, derived from azurerm_automation_connection_service_principal's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ConnectionName] !ok
  # path: name
  #   source:    [from validate.ConnectionName] !regexp.MustCompile(`^[\w\-]{1,128}$`).MatchString(v)
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: automation_account_name
  #   source:    validate.AutomationAccount: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

