# Set British Keyboard Layout and Super Key
setxkbmap -layout gb -option caps:super

# Set background
feh --bg-fill ~/Documents/dotfiles/wallpapers/redibm.png

# Set trackpoint sensitivity
echo 220 | sudo tee /sys/devices/platform/i8042/serio1/serio2/sensitivity

# Create and set wall terminal color theme
#wal -i ~/Documents/dotfiles/wallpapers/darklight.png
#~/Documents/dotfiles/laptop/scripts/wal-set
