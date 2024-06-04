#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root"
  exit 1
fi

# Instalando o Ansible
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update -qq
sudo apt install ansible -y

# Adicionando o host local
echo "[ubuntu]" >> /etc/ansible/hosts
echo "127.0.0.1" >> /etc/ansible/hosts
ansible-inventory --list -y

# Verifica se a chave SSH já existe
if [ ! -f "/root/.ssh/id_rsa" ]; then
  ssh-keygen -t rsa -b 4096 -f "/root/.ssh/id_rsa" -N ""
  echo "Host *" >> /root/.ssh/config
  echo "  StrictHostKeyChecking no" >> /root/.ssh/config
  cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
else
  echo "Chave SSH já existe em /root/.ssh/id_rsa, pulando a geração da chave."
fi

# Movendo os playbooks para ser utilizado
mv ./playbooks /etc/ansible/playbooks
