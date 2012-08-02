/usr/bin/keychain -Q -q --nogui ~/.ssh/id_ecdsa
[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh
