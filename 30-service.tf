resource "kubernetes_service" "hello-nginx" {
  metadata {
    name = "hello-nginx"
  }

  spec {
    selector {
      app = "${kubernetes_deployment.hello-nginx.metadata.0.name}"
    }

    port {
      port        = 80
    }

    type = "LoadBalancer"
  }
}
