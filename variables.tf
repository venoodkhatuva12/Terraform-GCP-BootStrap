variable "billing_id" {
  type        = string
  description = "GCloud Billing ID"
}
variable "org_id" {
  type        = string
  description = "Gcloud Org ID"
}
variable "iac_folder_name" {
  type        = string
  description = "IAC Folder Name "
}
variable "iac_storage_project_id" {
  type        = string
  description = "IAC Project ID"
}
variable "iac_storage_project_name" {
  type        = string
  description = "IAC Project Name"
}
variable "iac_devops_project_id" {
  type        = string
  description = "IAC DevOps Project ID"
}
variable "iac_devops_project_name" {
  type        = string
  description = "IAC DevOps Project Name"
}
variable "iac_service_account_id" {
  type        = string
  description = "IAC Service Account ID"
}
variable "iac_service_account_name" {
  type        = string
  description = "IAC Service Account Name"
}
variable "bucket_name" {
  type        = string
  description = "Foundational Bucket Name"
}
variable "roles" {
  type        = set(string)
  description = "Roles"
}

variable "project-roles" {
  type        = set(string)
  description = "Project Roles"
}
variable "services" {
  type        = set(string)
  description = "IAM Services"
}