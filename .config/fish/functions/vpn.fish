# start vpn client
function vpn -a command
    function usage
        echo "\
DESCRIPTION: Run vpn client with root rights. Will ask for root password.

USAGE: vpn <COMMAND>

COMMAND (required):
    run               :  run vpn client
    close             :  close vpn client
    help, -h, --help  :  show this help"
    end
    if test -z "$command"; set command ''; end
    set -l help_commands '' 'help' '-h' '--help'
    if test $command = 'run'
        sudo tmux new-session -d -s 'vpn' "$HOME/Applications/hiddify/AppRun"
    else if test $command = 'close'
        sudo tmux kill-session -t 'vpn'
    else if contains -- $command $help_commands # test \( -z $command \) -o \( $command = "help" \) -o \( $command = "-h" \)
        usage
    else
        echo "Invalid argument \"$command\"
        "
        usage
    end
end
