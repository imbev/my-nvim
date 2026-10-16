{ pkgs, ... }:
{
  imports = [
    ./bufferline.nix
    ./colorscheme.nix
    ./lsp.nix
  ];
}
