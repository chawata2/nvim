-- Key mappings
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("n", "x", '"_x', { noremap = true, desc = "Delete character without copying" })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, desc = "Clear search highlights" })
vim.keymap.set({ "n", "v" }, "<C-j>", '10j', { noremap = true, desc = "Move 10j" })
vim.keymap.set({ "n", "v" }, "<C-k>", '10k', { noremap = true, desc = "Move 10k" })
vim.keymap.set("n", "<leader>n", "<cmd>set number!<CR>", { noremap = true, desc = "Toggle line number" })

-- Exit terminal mode
vim.keymap.set("t", "<C-[>", [[<C-\><C-n>]], { silent = true })

-- folding
vim.keymap.set("n", "<leader>j", "za", { noremap = true, desc = "Toggle fold" })
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- filer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "=", "<CMD>Oil .<CR>", { desc = "Oil ." })

--fzf-lua
local opt = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", function() require('fzf-lua').files() end, opt)
vim.keymap.set("n", "<leader>E", function() require('fzf-lua').oldfiles() end, opt)
vim.keymap.set("n", "<leader>fg", function() require('fzf-lua').live_grep_native() end, opt)
vim.keymap.set("n", "<leader>fG", function() require('fzf-lua').live_grep_resume() end, opt)
vim.keymap.set("v", "<leader>fg", function() require('fzf-lua').grep_visual() end, opt)
vim.keymap.set("n", "<leader>fb", function() require('fzf-lua').buffers() end, opt)
vim.keymap.set("n", "<leader>fq", function() require('fzf-lua').quickfix() end, opt)
vim.keymap.set("n", "<leader>fs", function() require('fzf-lua').treesitter() end, opt)
-- vim.keymap.set("n", "<leader>fl", function() require('fzf-lua').loclist() end, opt)

-- LSP
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>')
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set({ 'n', 't' }, '<A-d>', '<cmd>Lspsaga term_toggle<CR>')

-- hop
vim.keymap.set('n', "<leader><leader>", "<cmd>HopChar2<CR>")

-- ClaudeCode
vim.keymap.set({ 'n', 't' }, '<C-_>', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })

-- grug-far
vim.keymap.set('n', '<leader>s',
    function()
        require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } }, { desc = "" })
    end,
    { desc = 'grug-far: search current file' })
vim.keymap.set('n', '<leader>S', function()
        require('grug-far').open()
    end,
    { desc = 'grug-far: search project' })

-- LuaSnip
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
