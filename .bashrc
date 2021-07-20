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

source /usr/share/bash-completion/completions/git
source /home/weston/miniconda3/etc/profile.d/conda.sh
source ~/.bash_profile

complete -C /usr/local/bin/vault vault

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/weston/google-cloud-sdk/path.bash.inc' ]; then . '/home/weston/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/weston/google-cloud-sdk/completion.bash.inc' ]; then . '/home/weston/google-cloud-sdk/completion.bash.inc'; fi
