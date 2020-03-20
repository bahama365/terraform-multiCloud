resource "aws_wafregional_ipset" "ipset" {
  name = "tfIPSet"

  ip_set_descriptor {
   type  = "IPV4"
   value = "109.144.0.0/16"
  }

  ip_set_descriptor {
    type  = "IPV4"
    value = "134.209.0.0/16"
  }
  
  ip_set_descriptor {
    type  = "IPV4"
    value = "89.238.154.164/32"
  }
}



resource "aws_wafregional_rule" "terraform" {
  name        = "tfWAFRule"
  metric_name = "tfWAFRule"

  predicate {
    data_id = aws_wafregional_ipset.ipset.id
    negated = false
    type    = "IPMatch"
  }
}

resource "aws_wafregional_web_acl" "terraform" {
  name        = "terraform"
  metric_name = "terraform"

  default_action {
    type = "ALLOW"
  }

  rule {
    action {
     type = "ALLOW"
#    type = "BLOCK"
    }

    priority = 1
    rule_id  = aws_wafregional_rule.terraform.id
  }
}

resource "aws_wafregional_web_acl_association" "terraform" {
  resource_arn = aws_lb.terraform.arn
  web_acl_id   = aws_wafregional_web_acl.terraform.id
}
       
