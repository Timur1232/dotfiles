# initialaze main tmux session automaticaly
function tmain
    if ! test -n "$TMUX"
        tmux a -t $MAIN_TMUX_SESSION
        if test "$status" -ne 0
            echo "Creating new $MAIN_TMUX_SESSION session"
            tmux new -s $MAIN_TMUX_SESSION
        end
    else
        echo "Already inside tmux session!"
    end
end

