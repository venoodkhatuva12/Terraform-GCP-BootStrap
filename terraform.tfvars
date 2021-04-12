org_id = "123456789000"
iac_folder_name = "Test Folder"
iac_storage_project_id = "tf-pipeline-storage-maven"
iac_storage_project_name = "IAC Storage Project"
iac_devops_project_id = "tf-pipeline-maven"
iac_devops_project_name = "DevOps Project"
# billing_id = "123456-ABCDEFG-DCEFGE"
billing_id = "123456-ABCDEFG-DCEFGE"
iac_service_account_id = "tf-pipeline-test"
iac_service_account_name = "Terraform Managed Service Account"
bucket_name = "test-terraform-state"
roles = [ "roles/resourcemanager.organizationAdmin", "roles/billing.admin"]
project-roles = ["roles/storage.admin", "roles/iam.serviceAccountKeyAdmin", "roles/iam.serviceAccountAdmin"]
services = [
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "compute.googleapis.com"
  ]