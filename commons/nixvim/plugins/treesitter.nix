{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      folding = true;
      indent = true;
    };
    plugins.treesitter-context.enable = true;
  };
}
