# cachyos include
source /usr/share/cachyos-fish-config/cachyos-config.fish

# User stuff

# No greetings
function fish_greeting
end

# Stupid try-rs won't shut up about configuring fish if I just rename try-rs to try, so I alias it
alias try "try-rs"

# Main tmux session name for tmain function
set -gx MAIN_TMUX_SESSION main

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Android
export ANDROID_HOME="$HOME/dev/thirdparty/android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/30.0.14904198"

export ANDROID_SDK="$ANDROID_SDK_ROOT"
export ANDROID_NDK="$ANDROID_NDK_HOME"

# Dotnet
export DOTNET_ROOT="$HOME/dev/thirdparty/dotnet/dotnet-sdk-10.0.301-linux-x64/"
export PATH="$PATH:$DOTNET_ROOT"
export PATH="$PATH:$HOME/.dotnet/tools/"

# Go
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin/"

# Some paths
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/var/lib/snapd/snap/bin"
