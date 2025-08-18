output "server_ids" {
  description = "IDs of all servers"
  value       = aws_instance.servers[*].id
}

output "server_public_ips" {
  description = "Public IP addresses of all servers"
  value       = [for instance in aws_instance.servers : instance.public_ip != null ? instance.public_ip : instance.private_ip]
}

output "server_details" {
  description = "Server names and IPs"
  value       = zipmap(var.server_names, [for instance in aws_instance.servers : instance.public_ip != null ? instance.public_ip : instance.private_ip])
}