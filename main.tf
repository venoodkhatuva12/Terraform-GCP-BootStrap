terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.62.0"
    }
  }
}

provider "google" {

  project = "test-gcp-devops"
  region  = "us-central1"
  zone    = "us-central1-c"
}

# Create IAC folder

resource "google_folder" "iacfolder" {
  display_name = var.iac_folder_name
  parent       = "organizations/${var.org_id}"
}

#Create Project

resource "google_project" "iacstorage" {
  name       = var.iac_storage_project_name
  project_id = var.iac_storage_project_id
  folder_id = google_folder.iacfolder.name
  billing_account = var.billing_id
 

}

resource "google_project" "iacdevops" {
  name       = var.iac_devops_project_name
  project_id = var.iac_devops_project_id
  folder_id = google_folder.iacfolder.name
  billing_account = var.billing_id
  
}

resource "google_service_account" "service_account" {
  account_id   = var.iac_service_account_id
  display_name = var.iac_service_account_name
  project      = var.iac_devops_project_id
  
  depends_on = [
    google_project.iacdevops
  ]
}


resource "google_project_iam_binding" "service_account_iam" {
  for_each = var.project-roles
  project = var.iac_storage_project_id
  role = each.key
  members = [ "serviceAccount:${var.iac_service_account_id}@${var.iac_devops_project_id}.iam.gserviceaccount.com" ]
  depends_on = [
    google_service_account.service_account, google_project.iacdevops, google_project.iacstorage
  ]
  
}

# Create Organization IAM binding

resource "google_organization_iam_binding" "org_iam_binding" {
  for_each = var.roles
  org_id = var.org_id
  role = each.key
  members = [ "serviceAccount:${var.iac_service_account_id}@${var.iac_devops_project_id}.iam.gserviceaccount.com" ]
  depends_on = [
    google_service_account.service_account, google_project.iacdevops, google_project.iacstorage
  ]
}

#Create Service Account Key and Save to local file

resource "google_service_account_key" "key" {
  service_account_id = google_service_account.service_account.name
   
}

resource "local_file" "mykey" { 
  filename = "${path.module}/${var.iac_service_account_id}-credentials.json"
  content = base64decode(google_service_account_key.key.private_key)
}

#Enable APIs
resource "google_project_service" "service" {
  for_each = var.services
  project = var.iac_devops_project_id
  service = each.key

  depends_on = [
    google_project.iacdevops
  ]
}


# Create Bucket
resource "random_id" "bucketid" {
  byte_length = 5
  
}

resource "google_storage_bucket" "bucket" {
  name = random_id.bucketid[0].hex
  project = var.iac_storage_project_id
  versioning {
    enabled = true
  }
  depends_on = [
    google_project.iacstorage
  ]
}