module "postgresql-db" {
  source               = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  name                 = "test-postgre-00"
  random_instance_name = true
  database_version     = "POSTGRES_9_6"
  db_name              = "test-db-00"
  project_id           = "devtools-317213"
  zone                 = "us-central1-c"
  region               = "us-central1"
  tier                 = "db-f1-micro"
  deletion_protection = false
  user_name = "mandi"
  user_password ="1234"

  ip_configuration = {
    ipv4_enabled        = false 
    private_network     = "projects/devtools-317213/global/networks/test-postgre-connection" #shared vpc network self link i.e host project self link
    require_ssl         = true
    authorized_networks = []
  }
}
