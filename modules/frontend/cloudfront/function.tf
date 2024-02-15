resource "aws_cloudfront_function" "viewer_request" {
  name    = "${terraform.workspace}-${var.project_name}-operator-viewer-request"
  runtime = "cloudfront-js-2.0"
  code = templatefile("${path.module}/source/viewer-request.js", {
    authen_username = var.authen_username
    authen_password = var.authen_password
  })
}
