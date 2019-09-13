source ~/.antigenrc

#ZSH_THEME="risto"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

export PATH=$HOME/bin:/usr/local/bin:~/.local/bin:$PATH
#export SHELL='/usr/bin/zsh'
export EDITOR='emacs'
#export ZSH="/home/roger/.oh-my-zsh"
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache" # see https://www.terraform.io/docs/configuration/providers.html#provider-plugin-cache

#source $ZSH/oh-my-zsh.sh

# alias tfdiff='~/git/cloud/aws-tools/tf/tfdiff.py'
# alias prxaws='export http_proxy=apineau:46%68%79%70%68%63%75%75%35%2f@http://evy01-proxy.eu.accor.net:3128;export https_proxy=apineau:46%68%79%70%68%63%75%75%35%2f@http://evy01-proxy.eu.accor.net:3128'
# alias prxpro='export http_proxy=http://proxy-pro.accor.net:8080;export https_proxy=http://proxy-pro.accor.net:8080'
# alias prxpri='export http_proxy=http://proxy-pri.accor.net:8080;export https_proxy=http://proxy-pri.accor.net:8080'
# alias tf_0.11.14='rm -f ~/bin/terraform && ln -s ~/bin/terraform_0.11.14 ~/bin/terraform'
# alias tf_0.12.7='rm -f ~/bin/terraform && ln -s ~/bin/terraform_0.12.7 ~/bin/terraform'
# alias cat='pygmentize -g'

alias python='/usr/bin/python3'
alias pip='/usr/bin/pip3'
alias samlapi='~/bin/samlapi'

# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
alias unsetaws='unset \
AWS_ACCESS_KEY_ID \
AWS_SECRET_ACCESS_KEY \
AWS_SESSION_TOKEN \
AWS_DEFAULT_REGION \
AWS_DEFAULT_OUTPUT \
AWS_PROFILE \
AWS_CA_BUNDLE \
AWS_SHARED_CREDENTIALS_FILE \
AWS_CONFIG_FILE;'

alias sts='unsetaws; \
account_id=216321699408; \
STS=`aws sts assume-role --role-arn arn:aws:iam::"$account_id":role/Administrator --role-session-name apineau`; \
export AWS_ACCESS_KEY_ID=`echo $STS | jq -r .Credentials.AccessKeyId`; \
export AWS_SECRET_ACCESS_KEY=`echo $STS | jq -r .Credentials.SecretAccessKey`; \
export AWS_SESSION_TOKEN=`echo $STS | jq -r .Credentials.SessionToken`; \
aws sts get-caller-identity;'

alias stspci='unsetaws; \
python ~/git/cloud/aws-tools/assume-role-cli-mfa/arcm.py; \
export AWS_PROFILE=default-ah-pci-role; \
aws sts get-caller-identity;'


eval `ssh-agent`

# plugins=(
#     git
#     aws
#     ssh-agent
#     terraform
# )

#ssh-add /home/roger/.ssh/id_rsa
#ssh-add /home/roger/.ssh/apineau_perso

