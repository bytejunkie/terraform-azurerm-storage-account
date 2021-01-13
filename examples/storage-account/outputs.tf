output "primary_access_key" {
  value = module.storage_account.storage_account.primary_access_key
}

output "secondary_access_key" {
  value = module.storage_account.storage_account.secondary_access_key
}
output "primary_connection_string" {
  value = module.storage_account.storage_account.primary_connection_string
}
output "secondary_connection_string" {
  value = module.storage_account.storage_account.secondary_connection_string
}
