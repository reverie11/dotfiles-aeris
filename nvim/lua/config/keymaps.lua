-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set
local unmap = vim.keymap.del

-- remove default lazyvim keybinding
unmap("v", "s")

-- File Navigation
map({ "n" }, "K", "'10k'", { desc = "10 Lines Up", expr = true, silent = true })
map({ "n" }, "J", "'10j'", { desc = "10 Lines Down", expr = true, silent = true })
map({ "i", "x" }, "<Leader>j", "'<Esc>'", { desc = "Back to Normal", expr = true, silent = true })

-- Saving & Exiting
map({ "n" }, "<Leader>w", "':w<CR>'", { desc = "Write", expr = true, silent = true })
map({ "n" }, "<Leader>q", "':bd<CR>'", { desc = "Close buffer", expr = true, silent = true })
map({ "n" }, "<Leader>Q", "':qa!<CR>'", { desc = "Quit without saving", expr = true, silent = true })

-- Tab navigation
--map({ "n" }, "<Leader>e", "':e '", { desc = "Edit a File", expr = true, silent = true })
--map({ "n" }, "<Leader>E", "':tabnew '", { desc = "Edit a File in other tab", expr = true, silent = true })

-- Editing
map({ "i" }, ";;", "'<Esc>A;'", { desc = "Add Semicolon at the end", expr = true, silent = true })
map({ "v" }, "p", "'\"_dP'", { desc = "Paste No Clipboard", expr = true, silent = true })
map({ "v" }, "s", "'\"_s'", { desc = "Substitute No Clipboard", expr = true, silent = true })
map({ "n" }, "x", "'v\"_d'", { desc = "Delete No Clipboard", expr = true, silent = true })

-- Terminal
map({ "t" }, "<Leader>j", "'<C-\\><C-n>'", { desc = "Escape from Terminal Insert", expr = true, silent = true })
map({ "t" }, "<Esc>", "'<C-\\><C-n>'", { desc = "Escape from Terminal Insert", expr = true, silent = true })


map({ "v" }, "<Leader>ww", function()
  vim.cmd("normal! J")
  vim.cmd("normal! gww")
  vim.cmd("normal! 0")
end, { desc = "Reformat Selected to Fit Textwidth", silent = true })

