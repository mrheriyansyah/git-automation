#!/bin/bash

REPEAT=y

clear
echo "======================================================================="
echo ""

# It's required figlet, lolcat, and 3d.flf font (optional)
# If you don't want bothered to install those tools, comment this line below
figlet -l -f 3d.flf "GIT AUTOMATION" | lolcat

# And uncomment this line below
# echo "GIT AUTOMATION"
echo ''
echo "======================================================================="
while  [ $REPEAT == y ]
do
	echo ""
	echo "Which config you want to push to GitHub?"
	echo ""
    echo "[01] - README.md |[06] - Hyprlock         | [11] - Wlogout - Style"
    echo "[02] - Push.sh   |[07] - Waybar (Config)  | [12] - Fastfetch (Config)"
    echo "[03] - Bash      |[08] - Waybar (Style)   | [13] - Fastfetch (Logo)"
	echo "[04] - Hyprland  |[09] - Waypaper         | [14] - Rofi"
	echo "[05] - Hypridle  |[10] - Wlogout - Layout | [15] - NVIM"
	echo ""
	read -p "Choose : " CHOOSE

	# Add a config file based on the choosen option
	if [ $CHOOSE == 1 ]; then
		git add README.md
	elif [ $CHOOSE == 2 ]; then
		git add push.sh
	elif [ $CHOOSE == 3 ]; then
		git add bash/.bashrc
	elif [ $CHOOSE == 4 ]; then
		git add hypr/.config/hypr/hyprland.conf
	elif [ $CHOOSE == 5 ]; then
		git add hypr/.config/hypr/hypridle.conf
	elif [ $CHOOSE == 6 ]; then
		git add hypr/.config/hypr/hyprlock.conf
	elif [ $CHOOSE == 7 ]; then
		git add waybar/.config/waybar/config.jsonc
	elif [ $CHOOSE == 8 ]; then
		git add waybar/.config/waybar/style.css
	elif [ $CHOOSE == 9 ]; then
		git add waypaper/.config/waypaper/config.ini
	elif [ $CHOOSE == 10 ]; then
		git add wlogout/.config/wlogout/layout
	elif [ $CHOOSE == 11 ]; then
		git add wlogout/.config/wlogout/style.css
	elif [ $CHOOSE == 12 ]; then
		git add fastfetch/.config/fastfetch/config.jsonc
	elif [ $CHOOSE == 13 ]; then
		git add fastfetch/.config/fastfetch/logo.png
	elif [ $CHOOSE == 14 ]; then
		git add rofi/.config/rofi/config.rasi
	elif [ $CHOOSE == 15 ]; then
		git add nvim/.config/nvim/
	else
		echo "That's not an option!"
        # Restore added files
        git restore --staged .
		exit 1
	fi

	# Commiting with message
    read -p "Commit's message : " MESSAGE
    git commit -m "$MESSAGE"

	# Asking for the loop
	echo ""
	read -p "Want to add more file? y/n : " REPEAT

	#Checking the answer
	if [[ $REPEAT != y && $REPEAT != n ]]; then
		echo "Don't be joking around!"
        # Restore added files
        git restore --staged .
        exit 1
	fi
done

# Push to main branch
git push origin main
