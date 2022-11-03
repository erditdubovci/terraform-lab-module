module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = local.subdomain
  zone_id      = data.aws_route53_zone.selected.zone_id

  subject_alternative_names = [
    "*.${local.subdomain}"
  ]

  wait_for_validation = true

  tags = {
    Name = local.subdomain
  }
}