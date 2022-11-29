swayidle -w timeout 300 'swaylock -f -i /home/kedar/.config/hypr/wallpapers/widewallpaper.jpg' \
	timeout 600 'hyprctl dispatch dpms off' \
	resume 'hyprctl dispatch dpms on' \
	before-sleep 'swaylock -f -i /home/kedar/.config/wallpapers/widewallpaper.jpg'
