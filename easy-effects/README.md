# Easy Effects

How to ensure Easy Effects runs on boot (even in Game Mode).

1. Install Easy Effects from store. Create a preset (or import `LegionGoS_Better_Sound.json` from this repo), and configure it to "Autoload" in Easy Effect's Preset settings.
2. Install xvfb
   - `sudo steamos-readonly disable`
   - `sudo pacman-key --init`
   - `sudo pacman-key --populate archlinux holo`
   - `sudo pacman -Sy archlinux-keyring holo-keyring`
   - `sudo pacman -S xorg-server-xvfb`
   - `sudo steamos-readonly enable`
3. Copy `easyeffects-xvfb` to `~/.local/bin` and make sure it's executable (`chmod +x`)
4. Copy `easyeffects-xvfb.service` to ~/.config/systemd/user
5. `systemctl --user enable --now easyeffects-xvfb.service`
