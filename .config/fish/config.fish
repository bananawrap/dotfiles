if status is-interactive
    # Commands to run in interactive sessions can go here
    # Aliases
    alias rm='safe-rm'
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    shuf -n1 -e fortune ubuntu-server-tip | bash | boxes -d stone
    echo ""
end
