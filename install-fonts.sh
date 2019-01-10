# The container
container="akirak/fonts-installer:latest"
# Where fonts are installed
destdir="$HOME/.local/share/fonts"
# List of fonts installed by default. These are my preferred fonts
defaults=(otf-overpass ttf-monaco otf-fantasque-sans-mono \
                       ephifonts otf-harenosora-mincho ttf-adobe-kaiti)

mountopt="type=bind,source=$destdir,destination=/usr/share/fonts"
mkdir -p $destdir
if [ $# -gt 0 ]; then
    docker run --mount=$mountopt $container "$@"
else
    docker run --mount=$mountopt $container $defaults
fi
fc-cache -fv
