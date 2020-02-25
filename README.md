

## Login 
- https://cloud.digitalocean.com/login
- https://aws.amazon.com/console/
	-- https://eu-west-3.console.aws.amazon.com/ec2/v2/home?region=eu-west-3#
- https://cloud.google.com/

From the service account key page in the Cloud Console choose an existing account, or create a new one. Next, download the JSON key file. Name it something you can remember, and store it somewhere secure on your machine.

You supply the key to Terraform using the environment variable GOOGLE_CLOUD_KEYFILE_JSON, setting the value to the location of the file.

export GOOGLE_CLOUD_KEYFILE_JSON={{path}}


## key gen

ssh-keygen -t rsa -b 4096 -f ansible/files/id_rsa

ssh  -i ansible/files/id_rsa root@142.93.58.167

#### Utility image usage

```bash
docker-compose up -d
docker exec -it ansible bash

# Install ansible roles (once-off)
ansible-galaxy install -r ansible/requirements.yml --roles-path ansible/roles

# Spin up the instances in different cloud providers:
ansible-playbook --become --become-user=root --extra-vars "cloud_provider=digitalocean" ansible/create.yml -vvv
ansible-playbook --become --become-user=root --extra-vars "cloud_provider=aws" ansible/create.yml -vvv
ansible-playbook --become --become-user=root --extra-vars "cloud_provider=google" ansible/create.yml -vvv


ansible-playbook --become --become-user=root --extra-vars "cloud_provider=digitalocean" ansible/create.yml -vvv
ansible-playbook --become --become-user=root --inventory ansible/environments/dev/inventory ansible/provision.yml -vvv

# generate diagram 
terraform graph | dot -Tpng > graph.png

# To tear down everything:
ansible-playbook --extra-vars "cloud_provider=digitalocean" ansible/destroy.yml -vvv
ansible-playbook --extra-vars "cloud_provider=aws" ansible/destroy.yml -vvv
ansible-playbook --extra-vars "cloud_provider=google" ansible/destroy.yml -vvv

docker-compose down
```

# References
- 
- https://www.kovarus.com/blog/hashicorp-terraform-and-red-hat-ansible-a-powerful-synergy-part-2/
- https://hackernoon.com/introduction-to-aws-with-terraform-7a8daf261dc0

Produce an Ansible inventory from a Terraform template
- https://www.terraform.io/docs/providers/template/d/file.html
- https://aukjan.vanbelkum.nl/2016/02/23/Ansible-inventory-from-Terraform/

https://codereviewvideos.com/course/installing-kubernetes-rancher-2-terraform/video/provision-digital-ocean-droplet-terraform
