output "key_name" {
  description = "Name of the key pair"
  value       = aws_key_pair.nodekey.key_name
}