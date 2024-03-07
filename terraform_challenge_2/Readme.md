# Terraform Challenege 1

## Install Terraform V1.1.5

```bash
sudo apt-get update
sudo apt install wget
sudo apt install zip
wget https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
unzip terraform_1.1.5_linux_amd64.zip
cp terraform /usr/bin/terraform
```

## Create provider.tf

Docker provider has already been configured using kreuzwerker/docker provider.
Check out the provider.tf given at /root/code/terraform-challenges/challenge2

## Create php-httpd-image

Create a terraform resource named php-httpd-image for building docker image with following specifications:
- Image name: php-httpd:challenge
- Build context: lamp_stack/php_httpd
- Labels: challenge: second

## Create mariadb-custom-image

Create a terraform resource named mariadb-image for building docker image with following specifications:
- Image name: mariadb:challenge
- Build context: lamp_stack/custom_db
- Labels: challenge: second

## Create Mariadb Volume

Create a terraform resource named mariadb_volume creating a docker volume with name=mariadb-volume

## Create Network

- Create a terraform resource named private_network and configure the following:
- Create a Docker network with name=my_network
- Enable manual container attachment to the network.
- User-defined key/value metadata: challenge: second

## Create Mariadb database

Define a terraform resource mariadb for creating docker container with following specification:
- Container Name: db
- Image Used: mariadb:challenge
- Hostname: db
- Define environment variables inside mariadb resource:
  MYSQL_ROOT_PASSWORD=1234
  MYSQL_DATABASE=simple-website
- Attach volume mariadb-volume to /var/lib/mysql directory within db container.

## Create db_dashboard

- Define a terraform resource phpmyadmin for docker container with following configurations:
- Container Name: db_dashboard
- Image Used: phpmyadmin/phpmyadmin
- Hostname: phpmyadmin
- Attach the container to network my_network
- Publish a container's port(s) to the host:
- Hostport: 0.0.0.0:8081
- containerPort: 80
- Labels: challenge: second
- Establish link based connectivity between db and db_dashboard containers (Deprecated)
- Explicitly specify a dependency on mariadb terraform resource

## Create WebServer

- Define a terraform resource php-httpd for creating docker container with following specification:
- Container Name: webserver
- Hostname: php-httpd
- Image used: php-httpd:challenge
- Attach the container to network my_network
- Publish a container's port(s) to the host:
- Hostport: 0.0.0.0:80
- containerPort: 80
- Labels: challenge: second
- Create a volume with host_path /root/code/terraform-challenges/challenge2/lamp_stack/website_content/ and container_path /var/www/html within webserver container.

