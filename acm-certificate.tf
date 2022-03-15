### Self-Signed TLS Certificate for Testing

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "this" {
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
  dns_names             = [var.rest_api_domain_name]
  key_algorithm         = tls_private_key.this.algorithm
  private_key_pem       = tls_private_key.this.private_key_pem
  validity_period_hours = 12

  subject {
    common_name  = var.rest_api_domain_name
    organization = "ACME Examples, Inc"
  }
}

resource "aws_acm_certificate" "this" {
  certificate_body = tls_self_signed_cert.this.cert_pem
  private_key      = tls_private_key.this.private_key_pem
}