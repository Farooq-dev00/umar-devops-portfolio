# PART 4 - Networking module
module "networking" {
  source = "./modules/networking"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  environment         = var.environment
}

# PART 5 - Compute module
module "compute" {
  source = "./modules/compute"

  vpc_id            = module.networking.vpc_id
  public_subnet_id  = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subnet_id
  instance_type     = var.instance_type
  admin_cidr        = var.admin_cidr
  key_name          = var.key_name
  environment       = var.environment
}

# PART 6 - Storage module (application S3 bucket)
module "storage" {
  source = "./modules/storage"

  bucket_name = var.bucket_name
  environment = var.environment
}
