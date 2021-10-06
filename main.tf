module "postgresql-db" {
  source               = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  name                 = var.name
 # random_instance_name = true 
  database_version     = var.database_version
  db_name              = var.db_name
  project_id           = var.project_id
  zone                 = var.zone 
  region               = var.region 
  tier                 = var.tier 
  deletion_protection = false
  user_name = var.user_name
  user_password =var.user_password

  ip_configuration = {
    ipv4_enabled        = true
    private_network     = var.private_network  #"projects/devtools-317213/global/networks/test-postgre-connection" #shared vpc network self link i.e host project self link
    require_ssl         = true
    authorized_networks = []
  }
}


# Notes
# To configure Private service access which is for postgre sql private ip
# Project owners and IAM members with the Compute Network Admin role (roles/compute.networkAdmin) can create allocated IP address ranges and manage private connections.
# I do not have permission to test the code, Let me know when we can test together

# Incase ip range is not added to project, This is for explicitly using for sql instances private ip

# module "private-service-access" {
#   source      = "GoogleCloudPlatform/sql-db/google//modules/private_service_access"
#   project_id  = var.project_id
#   vpc_network = var.vpc_network
#   ip_version  = "IPV4"
#   address = "192.168.0.0"
#   prefix_length = 16
# }



######## shared vpc project ######

# module "host-project" {
#   source                         = "terraform-google-modules/project-factory/google"
#   random_project_id              = true
#   name                           = var.host_project_name
#   org_id                         = var.organization_id
#   folder_id                      = var.folder_id
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
# }

######### VPC  ########

# module "vpc" {
#   source  = "terraform-google-modules/network/google"
#   version = "2.5.0"

#   project_id                             = module.host-project.project_id
#   network_name                           = var.network_name
#   delete_default_internet_gateway_routes = true

#   subnets = [
#     {
#       subnet_name   = subnet_01
#       subnet_ip     = "10.10.10.0/24"
#       subnet_region = "us-central1"
#     },
#   ]

# }