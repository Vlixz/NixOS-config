# NixOS Configuration

## 🚀 Installation

### 1. Clone the Repository

Clone this repository into your home directory:

```bash
cd ~
git clone https://github.com/Vlixz/NixOS-config.git NixOS
```

### 2. Stow the Configurations

Use GNU Stow to symlink the configuration files into `/etc/nixos/`:

```bash
sudo stow --target=/etc/nixos NixOS
```

### 3. Rebuild Your System

```bash
sudo nixos-rebuild switch
```
