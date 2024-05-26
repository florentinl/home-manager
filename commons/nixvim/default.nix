{...}: {
  imports = [
    ./autocmd.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./plugins
  ];

  programs.nixvim.clipboard.providers.wl-copy.enable = true;

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
  };

  programs.nixvim.colorschemes = {
    onedark.enable = true;
  };
}
