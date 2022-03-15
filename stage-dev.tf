#### Dev Stage and Settings

resource "aws_api_gateway_stage" "dev" {
    deployment_id = aws_api_gateway_deployment.this.id
    rest_api_id   = aws_api_gateway_rest_api.this.id
    stage_name    = var.stage_name_1
}

resource "aws_api_gateway_method_settings" "dev" {
    rest_api_id   = aws_api_gateway_rest_api.this.id
    stage_name    = aws_api_gateway_stage.dev.stage_name
    method_path   = "*/*"

    settings {
        metrics_enabled = var.bool
    }
}

resource "aws_api_gateway_method_settings" "devpathone" {
    rest_api_id   = aws_api_gateway_rest_api.this.id
    stage_name    = aws_api_gateway_stage.dev.stage_name
    method_path   = "path1/GET"

    settings {
        metrics_enabled = var.bool
        logging_level   = "INFO"
    }
}

resource "aws_api_gateway_method_settings" "devpathtwo" {
    rest_api_id   = aws_api_gateway_rest_api.this.id
    stage_name    = aws_api_gateway_stage.dev.stage_name
    method_path   = "path2/GET"

    settings {
        metrics_enabled = var.bool
        logging_level   = "INFO"
    }
}