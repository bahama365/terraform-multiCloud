#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<img src="https://hduihewuib.sfo2.cdn.digitaloceanspaces.com/milo.jpeg" alt="Milo Cat">" > /var/www/html/index.html
echo "<h1>Deployed via Terraform - Web2</h1>" >> /var/www/html/index.html

