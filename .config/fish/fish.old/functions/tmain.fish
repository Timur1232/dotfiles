# initialaze main tmux session automaticaly
function tmain
    if [ -n "$TMUX" ]
        tmux a -t "$MAIN_TMUX_SESSION" &> /dev/null
        if [ "$status" -ne 0 ]
            tmux new -s "$MAIN_TMUX_SESSION" &> /dev/null
        end
    end
end
