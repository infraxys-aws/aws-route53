#set ($route53Name = $instance.getAttribute("route53_name"))
resource "aws_route53_record" "$route53Name" {
  zone_id = $instance.getAttribute("route53_zone_id")
  name    = "$instance.getAttribute("route53_name")"
  type    = "CNAME"
  ttl     = $instance.getAttribute("route53_ttl")
  records = $instance.getAttribute("route53_records")
}

output "${route53Name}_name" {
    value = aws_route53_record.${route53Name}.name
}

output "${route53Name}_fqdn" {
    value = aws_route53_record.${route53Name}.fqdn
}