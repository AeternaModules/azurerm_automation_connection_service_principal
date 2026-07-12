output "automation_connection_service_principals_application_id" {
  description = "Map of application_id values across all automation_connection_service_principals, keyed the same as var.automation_connection_service_principals"
  value       = { for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : k => v.application_id }
}
output "automation_connection_service_principals_automation_account_name" {
  description = "Map of automation_account_name values across all automation_connection_service_principals, keyed the same as var.automation_connection_service_principals"
  value       = { for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : k => v.automation_account_name }
}
output "automation_connection_service_principals_certificate_thumbprint" {
  description = "Map of certificate_thumbprint values across all automation_connection_service_principals, keyed the same as var.automation_connection_service_principals"
  value       = { for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : k => v.certificate_thumbprint }
}
output "automation_connection_service_principals_description" {
  description = "Map of description values across all automation_connection_service_principals, keyed the same as var.automation_connection_service_principals"
  value       = { for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : k => v.description }
}
output "automation_connection_service_principals_name" {
  description = "Map of name values across all automation_connection_service_principals, keyed the same as var.automation_connection_service_principals"
  value       = { for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : k => v.name }
}
output "automation_connection_service_principals_resource_group_name" {
  description = "Map of resource_group_name values across all automation_connection_service_principals, keyed the same as var.automation_connection_service_principals"
  value       = { for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : k => v.resource_group_name }
}
output "automation_connection_service_principals_subscription_id" {
  description = "Map of subscription_id values across all automation_connection_service_principals, keyed the same as var.automation_connection_service_principals"
  value       = { for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : k => v.subscription_id }
}
output "automation_connection_service_principals_tenant_id" {
  description = "Map of tenant_id values across all automation_connection_service_principals, keyed the same as var.automation_connection_service_principals"
  value       = { for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : k => v.tenant_id }
}

