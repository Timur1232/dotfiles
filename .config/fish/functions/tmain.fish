# initialaze main tmux session automaticaly
export MAIN_TMUX_SESSION=main
function tmain
    if test -n "$TMUX"
        tmux a -t $MAIN_TMUX_SESSION &> /dev/null
        if test $status -ne 0
            tmux new -s $MAIN_TMUX_SESSION &> /dev/null
        end
    end
end

