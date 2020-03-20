# Create a new Spaces Bucket
resource "digitalocean_spaces_bucket" "mybucket" {
  name   = "hduihewuib"
  region = "sfo2"
  acl    = "public-read"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["https://website-origin.system-secure.com"]
  }

}

## Create a DigitalOcean managed Let's Encrypt Certificate
#resource "digitalocean_certificate" "cert" {
#  name    = "cdn-cert"
#  type    = "lets_encrypt"
#  domains = ["spaces.m7cch.co.uk"]
#}

# Add a CDN endpoint with a custom sub-domain to the Spaces Bucket
resource "digitalocean_cdn" "mycdn" {
  ttl            = 60
  origin         = digitalocean_spaces_bucket.mybucket.bucket_domain_name
#  custom_domain  = "spaces.m7cch.co.uk"
#  certificate_id = digitalocean_certificate.cert.id
}
