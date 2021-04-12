terraform {
 backend "gcs" {
   bucket  = "terrafrom-state-bucket"
   prefix  = "terraform/state"
 }
}
