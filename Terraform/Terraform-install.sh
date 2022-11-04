## Server Updaten und Abhängigkeiten installieren
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y gnupg software-properties-common azure-cli

## Installieren der Azure Komponente
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

## Terraform in die Sourcen von Ubuntu eintragen
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

## Terraform installieren
sudo apt update && sudo apt-get install terraform
terraform -install-autocomplete

