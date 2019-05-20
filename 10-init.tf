provider "kubernetes" {}

variable "image_registry" {
  type        = "string"
  description = "Base name for the docker image registry"
}

variable "hello_version" {
  type        = "string"
  description = "Version of the hello image to deploy"
}
