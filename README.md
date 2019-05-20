Try Terraform

# Pre-requisites

k8s set up with appropriate context, e.g.

    kubectl config get-contexts
    kubectl config use-context docker-for-desktop

images built and pushed to registry from 
[try-k8s](https://github.com/ianhomer/try-k8s)

# tl;dr

    brew install terraform
    terraform init
    
    terraform plan
    terraform apply
    
# Workflow

    brew install pre-commit
    pre-commit install

This will then automatically do the following on each commit

    terraform fmt
    terraform validate
        
# Restore state

Although the "tfstate" state file [should be stored for integrity purposes](https://www.terraform
.io/docs/state/purpose.html) - e.g. in [GCS backend](https://www.terraform.io/docs/backends/types/gcs.html) - you may
be able to import current state from real world, e.g.
    
    terraform import kubernetes_deployment.hello-nginx default/hello-nginx
    terraform import kubernetes_service.hello-nginx default/hello-nginx
    
Also note that if you do update deployment via another way - e.g console, kubectl apply, then terraform will do a 
```terraform refresh``` before the ```plan``` to get update the local state.    
    
