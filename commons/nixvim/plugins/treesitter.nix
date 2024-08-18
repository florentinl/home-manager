{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      folding = true;
      settings = {
        indent.enable = true;
      };
    };
    plugins.treesitter-context.enable = true;
  };
}
