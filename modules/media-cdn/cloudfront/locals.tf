locals {
  origin_id = "${terraform.workspace}-${var.project}-media-cdn"
  key_path  = "${path.module}/${terraform.workspace}-${var.project}-cf-key.pem"
}
