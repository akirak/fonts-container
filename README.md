# fonts-container

This is a Docker container for downloading font packages from Arch Linux User Repository (AUR) and extracting font files. I am no longer using Arch Linux daily, but AUR provides an extensive set of packages, including fonts that are not available in the repositories of other Linux distributions such as Debian. By taking advantage of AUR, this tool allows you to install various fonts without downloading them from original source repositories.

## Usage

A recommended way to install fonts using this container is to use `install-fonts.sh` script contained in the repository. You can pass the names of font packages to the script:

``` shell
sh install-fonts.sh otf-overpass ttf-monaco
```

When you run the script, first font files in the packages are installed to `~/.local/share/fonts`, and then `fc-cache` is run to update the font cache.

If you omit the arguments, it installs my preferred fonts.

Alternatively, you can directly use the container whose entry point is an AUR helper:

``` shell
docker run \
    --mount=type=bind,source=$HOME/.local/share/fonts,destination=/usr/share/fonts \
    akirak/fonts-installer:latest otf-overpass ttf-monaco
```

In the example above, font files from `otf-overpass` and `ttf-monaco` packages are installed to your home directory. Don't forget to run `fc-cache` after the container is run.

## License

MIT License
