### Domain Setup

resource "aws_api_gateway_domain_name" "this" {
  domain_name              = aws_acm_certificate.this.domain_name
  regional_certificate_arn = aws_acm_certificate.this.arn

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_base_path_mapping" "this" {
  api_id      = aws_api_gateway_rest_api.this.id
  domain_name = aws_api_gateway_domain_name.this.domain_name
  stage_name  = aws_api_gateway_stage.dev.stage_name
}