# fonts-container

This is a Docker container for downloading font packages from Arch Linux User Repository (AUR) and extracting font files. I am no longer using Arch Linux daily, but AUR has an extensive set of packages, including fonts that are not available in the repositories of other Linux distributions such as Debian.

## Usage

A recommended way to install fonts using this container is to use `install-fonts.sh` script contained in this repository. You can pass the names of font packages to the script:

``` shell
sh install-fonts.sh otf-overpass ttf-monaco
```

Font files are installed to `~/.local/share/fonts`, and `fc-cache` is run to update the font cache.

If you omit the arguments, the script installs my preferred script.

Alternatively, you can directly use the container whose entry point is an AUR helper:

``` shell
docker run \
    --mount=type=bind,source=$HOME/.local/share/fonts,destination=/usr/share/fonts \
    akirak/fonts-installer:latest otf-overpass ttf-monaco
```

## License

MIT License
