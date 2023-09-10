killall polybar
polybar -c $HOME/.config/polybar/config.ini highlight &
sleep 0.15
killall polybar
polybar -c $HOME/.config/polybar/config.ini topbar &
