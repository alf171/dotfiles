1. System Apply
Use this when you change your flake, packages, Home Manager config, etc.

Anywhere, run

`sudo nix run github:LnL7/nix-darwin -- switch --flake ~/dotfiles#macbook`

Eventually this may also work once root has flakes enabled:

darwin-rebuild switch --flake .#macbook

2. Add Packages
Edit:

~/dotfiles/home/common.nix

Add packages here:

home.packages = with pkgs; [
  tmux
  git
  fd
  ripgrep
  fzf
  zig
];

Then apply:

`sudo nix run github:LnL7/nix-darwin -- switch --flake ~/dotfiles#macbook`

Find Package Names
Search packages:

nix search nixpkgs ripgrep
nix search nixpkgs lua-language-server

Temporarily try a package without installing:

nix shell nixpkgs#fastfetch
fastfetch
exit

Run a package once:

nix run nixpkgs#fastfetch

Update Packages
Update pinned versions in flake.lock:

nix flake update

Then apply:

sudo nix run github:LnL7/nix-darwin -- switch --flake .#macbook

Check What Owns a Command

which -a tmux fzf rg fd zig nvim

Nix-managed tools should come from:

/etc/profiles/per-user/alaffont/bin

Bob-managed Neovim should come from Bob’s path.

Garbage Collect Old Nix Stuff
After updates pile up:

nix store gc

Or delete old generations first:

sudo nix-collect-garbage -d

Basic workflow:

cd ~/dotfiles
edit home/common.nix
git add .
sudo nix run github:LnL7/nix-darwin -- switch --flake .#macbook
