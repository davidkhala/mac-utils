install() {
  brew install --cask docker
  open -a Docker
}
installCompose() {
  brew install docker-compose
}
$@
