local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = false, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

local colors = require("onenord.colors").load()

require('onenord').setup({
  theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  --borders = true, -- Split window borders
  --fade_nc = false, -- Fade non-current windows, making them more distinguishable
  ---- Style that is applied to various groups: see `highlight-args` for options
  --styles = {
  --  comments = "NONE",
  --  strings = "NONE",
  --  keywords = "NONE",
  --  functions = "NONE",
  --  variables = "NONE",
  --  diagnostics = "underline",
  --},
  disable = {
  --  background = false, -- Disable setting the background color
  --  float_background = false, -- Disable setting the background color for floating windows
  --  cursorline = false, -- Disable the cursorline
  --  eob_lines = true, -- Hide the end-of-buffer lines
  },
  ---- Inverse highlight for different groups
  inverse = {
    CursorLine = true,
  },
  custom_colors = {
  }, -- Overwrite default colors
  custom_highlights = {
    Cursor              = { fg = colors.red,    bg = colors.red,            style = "NONE" },
    CursorIM            = { fg = colors.red,    bg = colors.red,            style = "NONE" },
    CursorLine          = { fg = colors.none,   bg = colors.none,           style = "NONE"},
    Visual              = { fg = colors.light3, bg = colors.dark_blue},
    VisualMode          = { fg = colors.light3, bg = colors.dark_blue,      style = "NONE" },
    Search              = { fg = colors.dark4,  bg = colors.orange,         style = "bold" },
    IncSearch           = { fg = colors.yellow, bg = colors.selection,      style = "bold" },
    MatchParen          = { fg = colors.dark4,  bg = colors.red,            style = "NONE" },
    LspReferenceText    = { fg = colors.yellow, style = "bold"},
    LspReferenceRead    = { fg = colors.yellow, style = "bold"},
    LspReferenceWrite   = { fg = colors.yellow, style = "bold"},
  }, -- Overwrite default highlight groups

})
