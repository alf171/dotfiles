{ pkgs, ... }:

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    tmux
    git
    fd
    ripgrep
    fzf

    zig
    clang
    cmake
    ninja

    python3
    lua-language-server
    nil
    stylua

    cloc
  ];
}
