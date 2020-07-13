set -e
install() {
    if ! brew config >/dev/null; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}
if [[ $(uname) == "Darwin" ]]; then
    $1
fi

