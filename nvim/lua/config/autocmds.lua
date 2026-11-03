-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- disable <S-k> that is configured to show hover info 
vim.api.nvim_create_autocmd('LSPAttach', {
  callback = function(args)
    local bufnr = args.buf
    pcall(vim.api.nvim_buf_del_keymap, bufnr, 'n', 'K')
  end,
})

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

require("flash").setup({
  -- disable default keymaps entirely
  keys = nil,
})
