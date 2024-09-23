{ pkgs, ... }:
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
    hardtime.enable = true;
    lualine.enable = true;
    nvim-autopairs.enable = true;
    project-nvim.enable = true;
    project-nvim.enableTelescope = true;
    web-devicons.enable = true;
    which-key.enable = true;
  };

  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [ precognition-nvim ];
  programs.nixvim.extraConfigLua = ''
    require('precognition').setup({})
  '';
}
