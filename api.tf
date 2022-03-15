resource "aws_api_gateway_rest_api" "this" {
    body = jsonencode({
        openapi = "3.0.1"
        info    = {
            title   = var.rest_api_name
            version = "1.0"
        }
    paths = {
    (var.rest_api_path_1) = {
        get = {
            x-amazon-apigateway-integration = {
                httpMethod           = "GET"
                payloadFormatVersion = "1.0"
                type                 = "HTTP_PROXY"
                uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
            }
          }
        },
    (var.rest_api_path_2) = {
        get = {
            x-amazon-apigateway-integration = {
                httpMethod           = "GET"
                payloadFormatVersion = "1.0"
                type                 = "HTTP_PROXY"
                uri                  = "https://www.gstatic.com/ipranges/goog.json"
            }
          }
        }    
      }
    })

    name = var.rest_api_name

    endpoint_configuration {
      types = [ "REGIONAL" ]
    }
}

resource "aws_api_gateway_deployment" "this" {
    rest_api_id  = aws_api_gateway_rest_api.this.id

    triggers     = {
        redeployment = sha1(jsonencode(aws_api_gateway_rest_api.this.body))
    }

    lifecycle {
      create_before_destroy = true      
    }
}