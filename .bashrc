#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Start an instance of ssh-agent if one isn't runnning
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(ssh-agent)"
fi


alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ ';

source /usr/share/bash-completion/completions/git
source ~/.bash_profile
