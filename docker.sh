install() {
  brew cask install docker
  open -a Docker
}
installCompose() {
  echo "Docker Desktop for Mac includes Compose along with other Docker apps, so Mac users do not need to install Compose separately."
  echo "More details: https://docs.docker.com/docker-for-mac/install/"
  exit 0
}
$@
