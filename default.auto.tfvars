image_registry = "gcr.io/try-10"

hello_version = "1.13"

k8s_enabled = "${terraform.workspace == "default" ? "true" : "false"}"
