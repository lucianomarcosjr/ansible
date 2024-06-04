# Ansible
Processo de instalação do Ansible no servidor Ubuntu 22.04 LTS. Se baixar o repositório, pode ser executado o script de instalação ou realizar o processo manualmente:
```bash
sudo bash install-ansible.sh
```
# Instalação Manual
## Etapa 1 - Instalando Ansible
```bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```
## Etapa 2 - Configurando o arquivo de inventário
```bash
echo "[ubuntu]" >> /etc/ansible/hosts
echo "127.0.0.1" >> /etc/ansible/hosts
ansible-inventory --list -y
```
## Etapa 3 - Configurar conexão SSH
```bash
ssh-keygen
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```
## Etapa 4 - Testando conexão
```bash
ansible ubuntu -m ping -u root
```
## Etapa 5 - Executando comandos ad-hoc (opcional)
```bash
ansible ubuntu -a "df -h" -u root
ansible ubuntu -m apt -a "name=vim state=latest" -u root
ansible ubuntu -a "uptime" -u root
```
## Etapa 6 - Mover os playbooks desse repositorio para o diretorio do ansible
```bash
mv ./playbooks /etc/ansible/playbooks
```
## Etapa 7 - Executando os playbooks disponiveis
```bash
ansible-playbook /etc/ansible/playbooks/default.yaml
```
## Referência

 - [DigitalOcean - How To Install and Configure Ansible on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-22-04)
