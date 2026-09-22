# ❄️ Dotfiles

<picture>
  <img alt="Desktop Preview" align="right" width="400px" src="assets/preview.jpg"/>
</picture>

> [!NOTE]
> **System Information:**
> * **OS:** NixOS
> * **Window Manager:** Swayfx
> * **Shell:** Zsh
> * **Terminal:** Foot 
> * **Editor:** Nixvim

## Installation

This guide assumes you have a fresh NixOS installation with Flakes enabled.

1. Clone the repository to your preferred location:
```bash
git clone https://github.com/f01zy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Copy the hardware configuration from your current system:
```bash
cp /etc/nixos/hardware-configuration.nix ./hosts/device-name/
```

3. Edit the variables (username, host) in `flake.nix` to match your setup.
4. Move your wallpapers into `~/Wallpapers` or change the path in `users/user/scripts/wallpaper.nix`.
5. Apply the system configuration:
```bash
sudo nixos-rebuild switch --flake .#hostname
```

## Keybinds

### Launch Applications

| Action       | Keybind          | Description                 |
|--------------|------------------|-----------------------------|
| Terminal     | `SUPER + RETURN` | Launch terminal with `tmux` |
| Browser      | `SUPER + B`      | Launch zen browser          |
| File Manager | `SUPER + M`      | Launch `lf` file manager    |
| App Menu     | `SUPER + D`      | Launch application menu     |

### Scripts

| Action           | Keybind             | Description                   |
|------------------|---------------------|-------------------------------|
| Select Wallpaper | `SUPER + W`         | Run wallpaper selector script |
| Random Wallpaper | `SUPER + SHIFT + W` | Choose random wallpaper       |
