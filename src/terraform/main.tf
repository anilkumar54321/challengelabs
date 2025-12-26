##
resource "google_project_service" "api_services" {
  project            = var.project_id
  service            = var.api_service
  disable_on_destroy = var.disable_on_destroy
}

variable "project_id" {
  description = "The ID of the Google Cloud project where the API will be enabled."
  type        = string
}

variable "api_service" {
  description = "The API service name to enable (e.g. sheets.googleapis.com)."
  type        = string
}

variable "disable_on_destroy" {
  description = "Whether to disable the API when this resource is destroyed."
  type        = bool
}
