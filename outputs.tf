output "folder_id" {
  value = google_folder.iacfolder.id
}
output "storage-bucket" {
  value = google_storage_bucket.bucket.url
}
