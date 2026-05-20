# 🖥️ Arch Linux Setup

Personal Arch Linux configuration for a developer workstation — dual boot with Windows 11 on the same physical drive.

## System Overview

| Component     | Choice          | Why                                                                 |
|---------------|-----------------|----------------------------------------------------------------------|
| OS            | Arch Linux      | Full control over every component, rolling release, AUR ecosystem, cool|
| Boot          | systemd-boot    | dual boot Windows + Arch on same drive — manual partition with EFI shared |
| DE            | KDE Plasma      | Balance between feature-rich and customizable                       |
| Terminal      | WezTerm         | GPU-accelerated, Lua-configurable, consistent across OS             |
| Prompt        | Starship        | Fast, cross-shell, shows git/cloud context at a glance             |
| AUR Helper    | yay             | AUR + pacman wrapper, minimal and maintained                        |
| File Manager  | Dolphin         | KDE-native, supports split view and terminal integration            |

## Repository Structure

```
arch-setup/
├── scripts/        # Automation scripts for setup and maintenance
├── starship/       # starship.toml prompt configuration
├── wezterm/        # wezterm.lua terminal configuration
└── packages.txt    # Full package list (pacman -Qqe)
```

## Partition Scheme

```
nvme0n1     259:0    0 476.9G  0 disk
├─nvme0n1p1 259:1    0   300M  0 part /boot
├─nvme0n1p2 259:2    0   128M  0 part
├─nvme0n1p3 259:3    0 308.8G  0 part
├─nvme0n1p4 259:4    0   900M  0 part
├─nvme0n1p5 259:5    0  16.8G  0 part
└─nvme0n1p6 259:6    0   150G  0 part /
```

## Challenges & Solutions

**Problem:** My first time install arch ,I try to boot with grub at first then I got kernel panic.
**Solution:** I change my boot loader to systemd-boot with new install and it's work. 

**Problem:** A week later after install I use sudo pacman -Syu and reboot then my boot option doesn't show arch only window that's avaible
**Solution:** use usb boot stick.Mount in root go through /boot partition .First I assumed my boot loader config must broke but no .
After I check I found my entries config is gone . so just build new one

