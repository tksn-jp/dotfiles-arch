##
## CAUTION:
##	path should be set in zprofile, not here!
##

### auto compile
if [ $HOME/.dotfiles/zsh/.zshrc -nt $HOME/.zshrc.zwc ]; then
	zcompile $HOME/.zshrc
fi

autoload -U compinit promptinit
compinit
promptinit

# enable help command
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups

#######################################################################################
####                              hooks                                            ####
#######################################################################################
source ~/.dotfiles/zsh/precmd_tmux.zsh
autoload -Uz add-zsh-hooks
add-zsh-hook precmd precmd_tmux

#######################################################################################
####                              aliases                                          ####
#######################################################################################
alias sudo='sudo '
alias le='exa -lahF'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias pow='powerpill'
alias pdf='okular'

#######################################################################################
####                         oh-my-zsh with antigen                                ####
#######################################################################################
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
antigen bundle extract

############################### plugins #########################################

## suggest package for invalid command
antigen bundle command-not-found
## directory listing with git status
antigen bundle supercrabtree/k
alias lk='k -a'
## cd to repository root
antigen bundle mollifier/cd-gitroot
alias cdg='cd-gitroot'
## z fork by knu
antigen bundle knu/z
## back directory
antigen bundle Tarrasch/zsh-bd
## Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
## additional completion
antigen bundle zsh-users/zsh-completions
## 256color
antigen bundle chrissicool/zsh-256color
## url check
antigen bundle ascii-soup/zsh-url-highlighter
## emoji
antigen bundle b4b4r07/emoji-cli
## historical substring completion
antigen bundle zsh-users/zsh-history-substring-search
## auto suggestion like fish
antigen bundle zsh-users/zsh-autosuggestions

## theme
antigen theme bureau

## Tell Antigen that you're done.
antigen apply

bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

# zle -N zle-line-init
# zle -N zle-keymap-select

### peco
source ~/.dotfiles/zsh/fzf.zsh
