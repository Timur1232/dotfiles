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
        tmux has-session -t 'vpn' 2> /dev/null
        if test $status -eq 0
            echo 'Session already launched!'
        else
            tmux new-session -d -s 'vpn' "$HOME/Applications/karing_1.2.23.2606_linux_amd64/AppRun"
        end
    else if test $command = 'close'
        tmux kill-session -t 'vpn'
    else if contains -- $command $help_commands # test \( -z $command \) -o \( $command = "help" \) -o \( $command = "-h" \)
        usage
    else
        echo "Invalid argument \"$command\"
        "
        usage
    end
end
