-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- copy to clipboard
vim.keymap.set("v", "  <leader>y  ", "+y")
vim.keymap.set("n", "  <leader>Y  ", "+yg_")
vim.keymap.set("n", "  <leader>y  ", "+y")
vim.keymap.set("n", "  <leader>yy  ", "+yy")

-- paste to clipboard
vim.keymap.set("n", " <leader>p ", "+p")
vim.keymap.set("n", " <leader>P ", "+P")
vim.keymap.set("v", " <leader>p ", "+p")
vim.keymap.set("v", " <leader>P ", "+P")

-- Since in my keyborad the arrow keys are in the same place of hljk in a qwerty kb.
vim.keymap.set("n", "<C-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
