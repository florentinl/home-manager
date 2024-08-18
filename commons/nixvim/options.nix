{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    splitbelow = true;
    splitright = true;
    scrolloff = 4;

    signcolumn = "yes";

    autoindent = false;
    expandtab = true;
    smartindent = false;
    foldopen = "all";

    ignorecase = true;
    incsearch = true;
    wildmode = "list:longest";
  };
}
