resource "google_cloud_run_service" "run_service" {
    count = var.create?1:0
    name = "app"
    location = var.gcp_region 

    template {
        spec {
            containers {
                image = "${var.gcp_region}-docker.pkg.dev/${var.gcp_project}/${var.ar_repo_id}/${var.image_name}:${var.image_tag}"
            }
        }
    }

    traffic {
        percent         = 100
        latest_revision = true
    }

}

resource "google_cloud_run_service_iam_member" "run_all_users" {
    count = var.create?1:0
    service  = google_cloud_run_service.run_service[count.index].name
    location = google_cloud_run_service.run_service[count.index].location
    role     = "roles/run.invoker"
    member   = "allUsers"
}