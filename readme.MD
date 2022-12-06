# Terraform templates for GCP

The files in this repository will setup the following resources in GCP:

Service Account
Virtual Machine with Ubuntu 18.04 LTS
Standard Persistent Disk

The idea for this template was to setup a Free Tier VM in GCP [according to the specs found here](https://cloud.google.com/free/docs/free-cloud-features).

## Instructions

Once you've authenticated your machine to work with GCP [according the instructions here](https://cloud.google.com/sdk/docs/authorizing), the only thing that needs to be provided for this to work is the project ID as indicated by `gcp-project-id` in the following instruction. In order to set it in Linux or MacOS, use the following syntax:

```
export TF_VAR_PROJECT_ID=gcp-project-id
```

In order to set it in Windows PowerShell, use the following syntax:

```
$Env:TF_VAR_PROJECT_ID = "gcp-project-id"
```

This will setup your Project ID as an environment variable, and this approach can work for other sensitive information you'd like to keep out of the repo.

I will continue to add more templates for various resources in GCP as well as Azure.