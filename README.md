#### Utility image usage

```bash
docker-compose up -d
docker exec -it ansible bash

# Install ansible roles (once-off)
ansible-galaxy install -r ansible/requirements.yml --roles-path ansible/roles

# Spin up the instances in different cloud providers:
ansible-playbook --become --become-user=root ansible/create.yml -vvv

# To tear down everything:
ansible-playbook ansible/destroy.yml -vvv
```

# References
- https://www.kovarus.com/blog/hashicorp-terraform-and-red-hat-ansible-a-powerful-synergy-part-2/
- https://hackernoon.com/introduction-to-aws-with-terraform-7a8daf261dc0