output "postgresql_instance_name" {
  value       = module.postgresql-db.instance_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "postgresql_private_ip_address" {
  description = "The first private (PRIVATE) IPv4 address assigned for the master instance"
  value       = module.postgresql-db.private_ip_address
}