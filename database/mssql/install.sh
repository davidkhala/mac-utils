repos() {

	brew tap microsoft/mssql-release https://github.com/Microsoft/homebrew-mssql-release
	brew trust microsoft/mssql-release
	brew update
}
odbc() {
	local version=${1:-18}
	repos
	HOMEBREW_ACCEPT_EULA=Y brew install --yes "msodbcsql${version}"
}
sqlcmd() {
	local version=${1:-18}
	repos
	if [ "$version" -eq 18 ]; then
		HOMEBREW_ACCEPT_EULA=Y brew install --yes "mssql-tools18"
	elif [ "$version" -eq 17 ]; then
		HOMEBREW_ACCEPT_EULA=Y brew install --yes "mssql-tools"
	fi

}
odbc-uninstall() {
	local version=${1:-18}
	brew uninstall "msodbcsql${version}"
	odbcinst -u -d -n "ODBC Driver $version for SQL Server"
}
sqlcmd-uninstall() {
	local version=${1:-18}
	if [ "$version" -eq 18 ]; then
		brew uninstall mssql-tools18
	elif [ "$version" -eq 17 ]; then
		brew uninstall mssql-tools
	fi

}

$@
