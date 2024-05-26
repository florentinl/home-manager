{
  programs.nixvim.keymaps = [
    # Neovim
    {
      mode = "t";
      key = "<C-space>";
      # Exit Terminal Mode
      action = "<C-\\><C-n>";
    }
    {
      mode = "i";
      key = "jk";
      action = "<ESC>";
    }

    # Telescope
    {
      mode = "n";
      key = "<leader>fd";
      action = ":Telescope find_files<CR>";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = ":Telescope live_grep<CR>";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = ":Telescope buffers<CR>";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = ":Telescope file_browser<CR>";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = ":Telescope help_tags<CR>";
    }
  ];
}
