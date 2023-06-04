#!/bin/bash

# Arrays of strings with the data needed to make it just right
TITLES=('TH01 - Highly Responsive to Prayers' 
'TH02 - Story of Eastern Wonderland' 
'TH03 - Phantasmagoria of Dim.Dream' 
'TH04 - Lotus Land Story' 
'TH05 - Mystic Square' 
'TH06 - Embodiment of Scarlet Devil' 
'TH07 - Perfect Cherry Blossom' 
'TH08 - Imperishable Night' 
'TH09 - Phantasmagoria of Flower View' 
'TH10 - Mountain of Faith' 
'TH11 - Subterranean Animism' 
'TH12 - Undefined Fantastic Object' 
'TH13 - Ten Desires' 
'TH14 - Double Dealing Character' 
'TH15 - Legacy of Lunatic Kingdom' 
'TH16 - Hidden Star in Four Seasons' 
'TH17 - Wily Beast and Weakest Creature' 
'TH18 - Unconnected Marketeers')

COVERS=(
    '/0/0e/Th01_sq.png'
    '/5/5d/Th02_sq.png'
    '/c/c2/Th03_sq.png'
    '/7/75/Th04_sq.png'
    '/0/06/Th05_sq.png'
    '/8/8b/Th06cover.jpg'
    '/5/52/Th07cover.jpg'
    '/5/59/Th08cover.jpg'
    '/2/25/Th09cover.jpg'
    '/6/6b/Th10cover.jpg'
    '/7/75/Th11_Cover.jpg'
    '/a/ae/Th12cover.jpg'
    '/6/66/Th13cover.jpg'
    '/d/d7/Th14cover.jpg'
    '/d/d7/Th15front.jpg'
    '/5/5e/Th16front.jpg'
    '/9/90/Th17cover.png'
    '/2/2e/Th18cover.jpg'
)

for i in {1..18}
do
    if [ $((10#$i + 1)) -lt 6 ]; then
	wget https://en.touhouwiki.net/images${COVERS[i-1]} -O $HOME/Pictures/game_icons/th${i}cover.png
	echo "hello"
    else
	wget https://en.touhouwiki.net/images${COVERS[i-1]} -O $HOME/Pictures/game_icons/th${i}cover.jpg
	echo "#!/bin/bash
	feh $HOME/Pictures/game_backgrounds/th${i}background.jpg -F --xinerama-index DVI-D-0&
	pid="$!"
	wine $HOME/Game_Files/Touhou_Project/THcrap/th06\ \(e\).lnk | cat
	echo "program.exe has finished"
	if [ "$pid" != "" ]; then
	    kill -9 "$pid"
	fi
	" > "$HOME/game_scripts/th${i}.bash"
	chmod +x "$HOME/game_scripts/th${i}.bash"
    fi

    echo "[Desktop Entry]
Type=Application
Name=${TITLES[i-1]}
Comment=Touhou Project $i
Exec=$HOME/game_scripts/th${i}.bash
Icon=$HOME/Pictures/game_icons/th${i}cover.jpg
Terminal=false
Categories=Game
" > "$HOME/Desktop/${TITLES[i-1]}.desktop"
    chmod +x "$HOME/Desktop/${TITLES[i-1]}.desktop"
    
done
