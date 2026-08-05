# Strip ANSI color codes
function nocol
    sed 's/\\x1b\\[[0-9;]*[a-zA-Z]//g'
end

