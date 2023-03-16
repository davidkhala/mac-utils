set -e
install() {
	if ! brew config >/dev/null; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "brew exists already"
	fi
}
uninstall() {
	brew uninstall $1

}
$@
