resource "google_artifact_registry_repository" "leo_test_gcr" {
    location    = var.gcp_region
    repository_id = var.ar_repo_id
    format = "DOCKER"
    description = "Leo Testing Google Container Registry"
}