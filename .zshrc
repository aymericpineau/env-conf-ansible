ZSH_THEME="risto"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

export PATH=$HOME/bin:/usr/local/bin:~/.local/bin:$PATH
export SHELL='/usr/bin/zsh'
export EDITOR='emacs'
export ZSH="/home/roger/.oh-my-zsh"
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache" # see https://www.terraform.io/docs/configuration/providers.html#provider-plugin-cache

source $ZSH/oh-my-zsh.sh

alias tfdiff='~/git/cloud/aws-tools/tf/tfdiff.py'
alias tf_0.11.14='rm -f ~/bin/terraform; ln -s ~/bin/terraform_0.11.14 ~/bin/terraform; terraform --version;'
alias tf_latest='rm -f ~/bin/terraform && ln -s ~/bin/terraform_0.12.9 ~/bin/terraform; terraform --version;'
alias vault_1.2.2='rm -f ~/bin/vault; ln -s ~/bin/vault_1.2.2 ~/bin/vault; vault --version;'
alias vault_latest='rm -f ~/bin/vault; ln -s ~/bin/vault_1.2.3 ~/bin/vault; vault --version;'
alias cat='pygmentize -g'

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
account_id=<account_number>; \
STS=`aws sts assume-role --role-arn arn:aws:iam::"$account_id":role/Administrator --role-session-name apineau`; \
export AWS_ACCESS_KEY_ID=`echo $STS | jq -r .Credentials.AccessKeyId`; \
export AWS_SECRET_ACCESS_KEY=`echo $STS | jq -r .Credentials.SecretAccessKey`; \
export AWS_SESSION_TOKEN=`echo $STS | jq -r .Credentials.SessionToken`; \
aws sts get-caller-identity;'

alias stspci='unsetaws; \
python ~/git/cloud/aws-tools/assume-role-cli-mfa/arcm.py; \
export AWS_PROFILE=default-ah-pci-role; \
aws sts get-caller-identity;'

# https://github.com/AlDanial/cloc#quick-start-
alias clocrecurcive='for d in ./*/ ; do (cd "$d" && echo "$d" && cloc --vcs git); done;'

eval `ssh-agent`

plugins=(
    git
    aws
    ssh-agent
    terraform
)

ssh-add /home/roger/.ssh/id_rsa
ssh-add /home/roger/.ssh/keys/security-dev-vault
ssh-add /home/roger/.ssh/apineau_perso


autoload -U +X bashcompinit && bashcompinit
source /etc/bash_completion.d/azure-cli
complete -o nospace -C /home/roger/bin/vault vault
