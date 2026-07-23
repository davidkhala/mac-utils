install() {
	brew install --cask docker-desktop
	# 不需要打开 GUI，等待 Docker daemon 启动即可
	for i in {1..60}; do
		docker ps >/dev/null 2>&1 && break
		sleep 1
	done

}
install-compose() {
	brew install docker-compose
	# 注册 compose 为 CLI 插件
	mkdir -p ~/.docker/cli-plugins
	ln -sfn "$(brew --prefix)/opt/docker-compose/bin/docker-compose" ~/.docker/cli-plugins/docker-compose
}

"$@"
