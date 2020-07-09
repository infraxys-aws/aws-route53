#set ($route53Name = $instance.getAttribute("route53_name"))
#set ($zoneId = $instance.getAttribute("route53_zone_id"))
#if ($zoneId == "")
#stop
#end
resource "aws_route53_record" "$route53Name" {
  zone_id = $zoneId
  name    = "$route53Name"
  type    = "A"
  alias {
    name                   = $instance.getAttribute("target_name")
    zone_id                = $instance.getAttribute("target_zone_id")
    evaluate_target_health = $instance.getBoolean("evaluate_target_health")
  }
}