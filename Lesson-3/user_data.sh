#!/bin/bash
yum -y update
yum -y install httpd
TOKEN=$(curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
myip=$(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform using External Script" > /var/www/html/index.html
echo "<br><font color="blue">Hello World!!" >> /var/www/html/index.html
sudo service httpd start
chkconfig httpd on