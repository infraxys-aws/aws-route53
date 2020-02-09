resource "aws_route53_record" "$instance.getAttribute("route53_name")" {
  zone_id = $instance.getAttribute("route53_zone_id")
  name    = "$instance.getAttribute("route53_name")"
  type    = "A"
  alias {
    name                   = $instance.getAttribute("target_name")
    zone_id                = $instance.getAttribute("target_zone_id")
    evaluate_target_health = $instance.getBoolean("evaluate_target_health")
  }
}