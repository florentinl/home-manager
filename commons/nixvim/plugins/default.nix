{ ... }:
{
  imports = [
    ./git.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim.plugins = {
    bufferline.enable = true;
    comment.enable = true;
    copilot-vim.enable = true;
    lualine.enable = true;
    nvim-autopairs.enable = true;
    project-nvim.enable = true;
    project-nvim.enableTelescope = true;
    web-devicons.enable = true;
    which-key.enable = true;
  };
}
