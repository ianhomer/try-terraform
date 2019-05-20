resource "kubernetes_deployment" "hello-nginx" {
  metadata {
    name = "hello-nginx"
  }

  spec {
    replicas = 2

    selector {
      match_labels {
        app = "hello-nginx"
      }
    }

    template {
      metadata {
        labels {
          app = "hello-nginx"
        }
      }

      spec {
        container {
          env {
            name = "MY_SECRET"

            value_from {
              secret_key_ref {
                name = "mock-secret"
                key  = "my-secret"
              }
            }
          }

          image             = "${var.image_registry}/hello-nginx:v${var.hello_version}"
          image_pull_policy = "IfNotPresent"
          name              = "hello-nginx"

          port {
            container_port = 80
            protocol       = "TCP"
          }
        }
      }
    }
  }
}
