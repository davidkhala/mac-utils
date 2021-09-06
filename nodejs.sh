install(){
    brew install node@14
    echo 'export PATH="/usr/local/opt/node@14/bin:$PATH"' >>~/.bash_profile
    export LDFLAGS="-L/usr/local/opt/node@14/lib"
    export CPPFLAGS="-I/usr/local/opt/node@14/include"
}
$1
