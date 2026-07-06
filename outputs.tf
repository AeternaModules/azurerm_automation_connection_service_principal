output "automation_connection_service_principals" {
  description = "All automation_connection_service_principal resources"
  value       = azurerm_automation_connection_service_principal.automation_connection_service_principals
}
output "automation_connection_service_principals_application_id" {
  description = "List of application_id values across all automation_connection_service_principals"
  value       = [for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : v.application_id]
}
output "automation_connection_service_principals_automation_account_name" {
  description = "List of automation_account_name values across all automation_connection_service_principals"
  value       = [for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : v.automation_account_name]
}
output "automation_connection_service_principals_certificate_thumbprint" {
  description = "List of certificate_thumbprint values across all automation_connection_service_principals"
  value       = [for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : v.certificate_thumbprint]
}
output "automation_connection_service_principals_description" {
  description = "List of description values across all automation_connection_service_principals"
  value       = [for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : v.description]
}
output "automation_connection_service_principals_name" {
  description = "List of name values across all automation_connection_service_principals"
  value       = [for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : v.name]
}
output "automation_connection_service_principals_resource_group_name" {
  description = "List of resource_group_name values across all automation_connection_service_principals"
  value       = [for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : v.resource_group_name]
}
output "automation_connection_service_principals_subscription_id" {
  description = "List of subscription_id values across all automation_connection_service_principals"
  value       = [for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : v.subscription_id]
}
output "automation_connection_service_principals_tenant_id" {
  description = "List of tenant_id values across all automation_connection_service_principals"
  value       = [for k, v in azurerm_automation_connection_service_principal.automation_connection_service_principals : v.tenant_id]
}

