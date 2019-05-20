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