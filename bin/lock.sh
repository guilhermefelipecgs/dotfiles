killall -SIGUSR1 dunst
[[ $? == 0 || -z $(ps aux | grep [d]unst) ]] && i3lock -c 000000 -n
killall -SIGUSR2 dunst
