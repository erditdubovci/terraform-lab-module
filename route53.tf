data "aws_route53_zone" "selected" {
  name         = "apstellar.training"
  private_zone = false
}

data "aws_lb" "this" {
    tags = {
        "ingress.k8s.aws/resources" = "LoadBalancer",
        "ingress.k8s.aws/stack"     = "default",
        "elbv2.k8s.aws/cluster"     = "my-eks-cluster"
    }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = local.subdomain
  type    = "A"
  ttl     = 300
  
  alias {
    name                   = data.aws_lb.this.dns_name
    zone_id                = data.aws_route53_zone.selected.zone_id
    evaluate_target_health = true
  }
}