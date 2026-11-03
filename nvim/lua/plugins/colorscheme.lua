return {
  -- add gruvbox
  --,{ "ellisonleao/gruvbox.nvim" },
  {
    "reverie11/onenord.nvim",
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onenord",
      --colorscheme = "gruvbox",
    },
  },
}
