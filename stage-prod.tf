#### Prod Stage and Settings

resource "aws_api_gateway_stage" "prod" {
    deployment_id = aws_api_gateway_deployment.this.id
    rest_api_id   = aws_api_gateway_rest_api.this.id
    stage_name    = var.stage_name_2
}

resource "aws_api_gateway_method_settings" "prod" {
    rest_api_id   = aws_api_gateway_rest_api.this.id
    stage_name    = aws_api_gateway_stage.prod.stage_name
    method_path   = "*/*"

    settings {
        metrics_enabled = var.bool
    }
}

resource "aws_api_gateway_method_settings" "prodpathone" {
    rest_api_id   = aws_api_gateway_rest_api.this.id
    stage_name    = aws_api_gateway_stage.prod.stage_name
    method_path   = "path1/GET"

    settings {
        metrics_enabled = var.bool
    }
}