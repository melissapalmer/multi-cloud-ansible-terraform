[web]
${consul_address1}

[web:vars]
ansible_ssh_private_key_file=ansible/files/id_rsa
ansible_ssh_common_args="'-o StrictHostKeyChecking=no'"