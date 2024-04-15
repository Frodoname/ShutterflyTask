# we start measuring the script time
START_TIME=$(date +%s)

# find the directory where the executable script file is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

# go to it
cd "$DIR"

export MINT_PATH="$HOME/.mint/bin"
export PATH=${PATH}:${MINT_PATH}

# SwiftGen
# creating Generated files
function mkdir_touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}

mkdir_touch ShutterflyTask/Application/Resource/Generated/Strings+Generated.swift

# initial generating texts
swiftgen #config run --config SwiftGen/swiftgen.yml

# stop mesauring the script time 
END_TIME=$(date +%s)
ELAPSED_TIME=$(( $END_TIME - $START_TIME ))
printf "\342\217\261  Script worked for \033[1;32m$ELAPSED_TIME\033[0m second(s)\n"
