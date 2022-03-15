### Outputs

output "curl_awsdomain_url" {
  depends_on = [aws_api_gateway_base_path_mapping.this]

  description = "API Gateway Domain URL (self-signed certificate)"
  value       = "curl -H 'Host: ${var.rest_api_domain_name}' https://${aws_api_gateway_domain_name.this.regional_domain_name}${var.rest_api_path_1} # may take a minute to become available on initial deploy"
}

output "curl_stageaws_invoke_url" {
  description = "API Gateway Stage Invoke URL"
  value       = "curl ${aws_api_gateway_stage.dev.invoke_url}${var.rest_api_path_1}"
}

output "curl_gcpdomain_url" {
  depends_on = [aws_api_gateway_base_path_mapping.this]

  description = "API Gateway Domain URL (self-signed certificate)"
  value       = "curl -H 'Host: ${var.rest_api_domain_name}' https://${aws_api_gateway_domain_name.this.regional_domain_name}${var.rest_api_path_2} # may take a minute to become available on initial deploy"
}

output "curl_gcpstage_invoke_url" {
  description = "API Gateway Stage Invoke URL"
  value       = "curl ${aws_api_gateway_stage.dev.invoke_url}${var.rest_api_path_2}"
}