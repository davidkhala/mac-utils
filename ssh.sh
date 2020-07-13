set -e
genRSA() {
    local keySize
    local email
    local rsaKeyPrv
    read -p "enter email (default:david-khala@hotmail.com):" email
    read -p "enter keySize (default:4096) :" keySize
    keySize=${keySize:-4096}
    email=${email:-"david-khala@hotmail.com"}
    ssh-keygen -t rsa -b $keySize -C $email
    eval "$(ssh-agent -s)"



    if [[ -f ~/.ssh/config ]];then
        local content="
        Host *
            AddKeysToAgent yes
            UseKeychain yes
            IdentityFile ~/.ssh/id_rsa
        "
        echo ${content} >> ~/.ssh/config
    fi
    read -p "Enter key file path again ($HOME/.ssh/id_rsa):" rsaKeyPrv
    rsaKeyPrv=${rsaKeyPrv:-"$HOME/.ssh/id_rsa"}
    ssh-add -K $rsaKeyPrv
}
copyRSAPub() {
    pbcopy < ~/.ssh/id_rsa.pub
}
if [[ $(uname) == "Darwin" ]]; then
    $1
fi
