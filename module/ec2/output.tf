output "public_ip" {
  description = "Private DNS name of the EC2 instance."
  value       = aws_instance.public_ip
}

