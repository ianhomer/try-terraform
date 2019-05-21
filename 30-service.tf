resource "kubernetes_service" "hello-nginx" {
  count = "${var.k8s_enabled == "true" ? 1 : 0}"

  metadata {
    name = "hello-nginx"
  }

  spec {
    selector {
      app = "${kubernetes_deployment.hello-nginx.metadata.0.name}"
    }

    port {
      port = 80
    }

    type = "LoadBalancer"
  }
}
