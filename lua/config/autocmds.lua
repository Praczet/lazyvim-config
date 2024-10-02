-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- For markdown files set textwidth to 80 and colorcolumn to 80
vim.cmd("autocmd FileType markdown setlocal textwidth=80 |  setlocal colorcolumn=80")
