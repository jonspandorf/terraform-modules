output "app-uri" {
    value = aws_alb.application-loadbalancer.dns_name
}