# PART 4 - Networking outputs
output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_id" {
  value = module.networking.public_subnet_id
}

output "private_subnet_id" {
  value = module.networking.private_subnet_id
}

# PART 5 - Compute outputs
output "public_ec2_id" {
  value = module.compute.public_instance_id
}

output "public_ec2_ip" {
  value = module.compute.public_instance_ip
}

output "private_ec2_id" {
  value = module.compute.private_instance_id
}

output "private_ec2_ip" {
  value = module.compute.private_instance_ip
}

# PART 6 - Storage outputs
output "application_bucket" {
  value = module.storage.bucket_id
}

output "application_bucket_arn" {
  value = module.storage.bucket_arn
}
