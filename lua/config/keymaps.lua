-- Keymaps are automatically loaded on the VeryLazy event.
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This is a dummy text {with a lot of is and this}
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open All Folds" })
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close All Folds" })
vim.keymap.set("n", "<C-c>", [[:%yank<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>p", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>p", "", { noremap = true, silent = true })

local wk = require("which-key")

-- Register mappings for normal mode
wk.add({
  { "<leader>p", group = "Paste" },
  {
    "<leader>pf",
    ":lua require('my-functions').ReplaceFlashWithClipboard()<CR>",
    desc = "Replace with flash motion and clipboard",
  },
  {
    "<leader>pm",
    ":lua require('my-functions').ReplaceMotionWithClipboard()<CR>",
    desc = "Replace motion with clipboard",
  },
  { "<leader>pp", "<cmd>Telescope yank_history<cr>", desc = "Paste from yank history" },
  { "<leader>ps", '"_c<C-r>+', desc = "Replace selection with clipboard" },
  { "<leader>pw", '"_ciw<C-r>+', desc = "Replace word under cursor with clipboard" },
})
-- Register mappings for visual mode
wk.add({
  {
    mode = { "v" },
    { "<leader>p", group = "Paste" },
    { "<leader>pp", "<cmd>Telescope yank_history<cr>", desc = "Paste from yank history" },
    { "<leader>ps", '"_c<C-r>+', desc = "Replace selection with clipboard" },
  },
})

-- Which key definition
-- Map the escape sequences sent by WezTerm
vim.api.nvim_set_keymap("i", "<M-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-j>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-l>", "<Right>", { noremap = true, silent = true })

-- binding '\' to the last command
vim.api.nvim_set_keymap("n", "\\", ":<C-u>@:<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "\\", ":<C-u>@:<CR>", { noremap = true, silent = true })
