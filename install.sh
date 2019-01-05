# Optionally, you can edit /etc/pacman.d/mirrorlist to download the archives faster
useradd -m arch
echo "arch ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/arch
pacman -Syy --noconfirm sudo git base-devel
pacman -S --asdeps --noconfirm go
su arch
git clone https://aur.archlinux.org/yay.git
cd
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
yay -S --noconfirm --noredownload \
    otf-overpass ttf-monaco otf-fantasque-sans-mono \
    ephifonts otf-harenosora-mincho ttf-adobe-kaiti
