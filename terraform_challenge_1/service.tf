resource "kubernetes_service" "webapp-service" {
    metadata {
      name = "webapp-service"
    }
    
    spec {
        type = "NodePort"

      selector = {
        name = "webapp"
      }
      
      port {
        port = 8080
        node_port = 30080
      }
    }

    depends_on = [ kubernetes_deployment.frontend ]
  
}