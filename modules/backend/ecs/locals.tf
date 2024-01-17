locals {
  container_name = "${terraform.workspace}-${var.project}-backend"
  container_port = 3000
}
