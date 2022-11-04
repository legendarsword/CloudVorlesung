# Abhängigkeiten installieren
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install python3 software-properties-common

# Ansible installieren
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

#Prüfen, ob Ansible installiert ist
ansible --version