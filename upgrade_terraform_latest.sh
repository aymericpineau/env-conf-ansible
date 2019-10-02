#!/bin/bash

tf_to_rm="0.12.8"
tf_to_dl="0.12.9"
tf_to_dl_link="https://releases.hashicorp.com/terraform/"$tf_to_dl"/terraform_"$tf_to_dl"_linux_amd64.zip"

rm terraform
rm terraform_$tf_to_rm
wget $tf_to_dl_link
unzip "terraform_"$tf_to_dl"_linux_amd64.zip"
mv terraform terraform_$tf_to_dl
ln -s terraform_$tf_to_dl terraform
rm "terraform_"$tf_to_dl"_linux_amd64.zip"
