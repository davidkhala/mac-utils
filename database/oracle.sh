installClient() {
	brew trust instantclienttap/instantclient
	brew tap InstantClientTap/instantclient
	brew install instantclient-tools
}
$@
