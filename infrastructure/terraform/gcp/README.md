1. Enable Services in gcl
    ```
    gcloud services enable run.googleapis.com # cloud run
    gcloud services enable container.googleapis.com # kubernetes engine
    ```
2. Grant access in IAM. 
    ```
    Artifact Registry Administrator
    Cloud Run Admin
    Editor
    Project IAM Admin
    Service Usage Admin 
    ```

### References
1. [Automating Terraform Deployment to Google Cloud with GitHub Actions](https://medium.com/interleap/automating-terraform-deployment-to-google-cloud-with-github-actions-17516c4fb2e5)
2. [Rapid Prototyping Using Terraform, GitHub Action, Docker and Streamlit in GCP](https://towardsdatascience.com/rapid-prototyping-using-terraform-github-action-docker-and-streamlit-in-gcp-e623ae3fdd54)
3. [Create and manage service account keys](https://cloud.google.com/iam/docs/creating-managing-service-account-keys)
4. [Set up Google Cloud Platform (GCP) authentication for Terraform Cloud](https://stackoverflow.com/questions/68290090/set-up-google-cloud-platform-gcp-authentication-for-terraform-cloud)
5. [Deploying a Flask API to Google Cloud Run using Terraform - Part 1](https://www.fpgmaas.com/blog/deploying-a-flask-api-to-cloudrun)