resource "aws_route53_record" "www" {
  zone_id = "ZK76403DLD0O4"
  name    = "loadbalancer-eu-west-2.system-secure.com"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_lb.terraform.dns_name}"]
}

resource "aws_route53_record" "alias" {
  zone_id = "ZK76403DLD0O4"
  name    = "website-origin.system-secure.com"
  type    = "A"
  set_identifier = "London Region"
        alias {
                name                   = aws_lb.terraform.dns_name
                zone_id                = aws_lb.terraform.zone_id
                evaluate_target_health = true
        }
        weighted_routing_policy {
        weight = 0
        }
}

