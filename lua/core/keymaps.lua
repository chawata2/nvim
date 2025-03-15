-- Key mappings
vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("n", "x", '"_x', { noremap = true, desc = "Delete character without copying" })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, desc = "Clear search highlights" })