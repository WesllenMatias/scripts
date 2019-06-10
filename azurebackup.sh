#!/bin/bash

#Checar se azcopy está instalado

[ ! -x $(which ssh) ] && pkg install ssh -y > /dev/null && \
[ ! -x $(which ssh) ] && pkg install curl -y > /dev/null && \
[ ! -x $(which azcopy) ] && sudo apt install linux-tools-azure -y > /dev/null && \

#Instalando as dependencias necessárias para rodar o AzCopy no Linux
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb && \
sudo dpkg -i packages-microsoft-prod.deb && \
sudo apt-get install apt-transport-https && \
sudo apt update && \
sudo apt-get install dotnet-sdk-2.2

#Usando o AzCopy
#azcopy \
#--source <caminho_origem_dos_arquivos> \
#--destination <caminho_do_blob_storage> \
#--dest-key <acess_key> \
#--recursive


azcopy \
--source /home/wesllen/Documentos/scripts/ \
--destination https://storageblobparabackup.blob.core.windows.net/backup \
--dest-key DiNitI8FygmYyGDgZ+9EreIDBO0gCVXkc+QslAcS6TqYcDNm7QBu2XwpRl+7risxOYpkEtYE8U5N17fyUbtioQ== \
--recursive
