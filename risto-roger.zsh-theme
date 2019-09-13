# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:
# It might be bash like, but I can't have my co-workers knowing I use zsh

# More info:
#  https://superuser.com/questions/943844/add-timestamp-to-oh-my-zsh-robbyrussell-theme/943916
#  https://linux.die.net/man/1/zsh
#  https://linux.die.net/man/1/zshmisc
#  https://linux.die.net/man/1/zshzle

PROMPT='%{$fg_bold[magenta]%}%L %{$fg[green]%}%n@%m:%{$fg_bold[cyan]%}%8~ $(git_prompt_info)%{$reset_color%}%(!.#.$) '
RPROMPT='%F{yellow}%T%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"

# ZSH_THEME_AWS_PREFIX="%{$fg[yellow]%}‹aws"
# ZSH_THEME_AWS_SUFFIX="›%{$reset_color%}"
