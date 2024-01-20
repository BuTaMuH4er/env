# Set up the prompt

autoload -Uz promptinit
#This loads the Version Control System into your prompt
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b ' #sets up the Git branch details into your prompt
precmd() { vcs_info }

promptinit
prompt adam1

setopt histignorealldups sharehistory prompt_subst INC_APPEND_HISTORY EXTENDED_HISTORY
unsetopt HIST_SAVE_NO_DUPS       # Write a duplicate event to the history file
#PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTTIMEFORMAT="[%F %T] "
HISTFILE=~/.zsh_history

#5 strings for searching throught history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "${key[Up]}" history-beginning-search-backward-end
bindkey "${key[Down]}" history-beginning-search-forward-end

# Use modern completion system
autoload -Uz compinit    # this for initialization completion
compinit                 # this for initialization completion:w

#can display the list of files and folder matched with more details, similar to the information you can display with ls -l
zstyle ':completion:*' file-list all   

# Allow you to select in a menu
#zstyle ':completion:*' menu select

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

PATH="/home/vd8ri3all/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/vd8ri3all/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/vd8ri3all/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/vd8ri3all/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/vd8ri3all/perl5"; export PERL_MM_OPT;

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
source ~/.helmrc
