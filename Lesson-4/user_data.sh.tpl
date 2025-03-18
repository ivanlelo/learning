#!/bin/bash
yum -y update
yum -y install httpd

TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`

myip=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<h2>Build by Power of Terraform <font color="red"> v1.11</font><h2><br>
Owner ${f_name} ${l_name} <br>

%{ for x in names ~}
Hello to ${x} from ${f_name}<br>
%{ endfor ~}

</html>
EOF

sudo service httpd start
chkconfig httpd on