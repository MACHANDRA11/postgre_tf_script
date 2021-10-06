variable "name" {
  type        = string
  description = "The name of the postgre  Cloud SQL resources"
}

// required
variable "database_version" {
  description = "The database version to use"
  type        = string
}


variable "db_name" {
  description = "The name of the default database to create"
  type        = string
  default     = "default"
}


variable "project_id" {
  type        = string
  description = "The project ID to manage the Cloud SQL resources"
}


// required
variable "region" {
  type        = string
  description = "The region of the Cloud SQL resources"
  default     = "us-central1"
}

variable "tier" {
  description = "The tier for the master instance."
  type        = string
  default     = "db-f1-micro"
}

variable "zone" {
  type        = string
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
}

variable "user_name" {
  description = "The name of the default user"
  type        = string
  default     = "default"
}

variable "user_password" {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  type        = string
  default     = ""
}

variable "postgre_sql_Private_network" {
  description = "The postgre sql private network selflink"
  type = string
}
