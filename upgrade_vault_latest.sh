#!/bin/bash

vault_to_rm="1.2.2"
vault_to_dl="1.2.3"
vault_to_dl_link="https://releases.hashicorp.com/vault/"$vault_to_dl"/vault_"$vault_to_dl"_linux_amd64.zip"

rm vault
rm terraform_$vault_to_rm
wget $vault_to_dl_link
unzip "vault_"$vault_to_dl"_linux_amd64.zip"
mv vault vault_$vault_to_dl
ln -s vault_$vault_to_dl vault
rm "vault_"$vault_to_dl"_linux_amd64.zip"
