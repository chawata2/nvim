-- Key mappings
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("n", "x", '"_x', { noremap = true, desc = "Delete character without copying" })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, desc = "Clear search highlights" })
vim.keymap.set({ "n", "v" }, "<C-j>", '10j', { noremap = true, desc = "Move 10j" })
vim.keymap.set({ "n", "v" }, "<C-k>", '10k', { noremap = true, desc = "Move 10k" })

-- Exit terminal mode
vim.keymap.set("t", "<C-[>", [[<C-\><C-n>]], { silent = true })

-- folding
vim.keymap.set("n", "<leader>j", "za", { noremap = true, desc = "Toggle fold" })
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- filer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "=", "<CMD>Oil .<CR>", { desc = "Oil ." })

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
-- <C-h>で隠しファイルをトグルする
-- https://github.com/nvim-telescope/telescope.nvim/issues/2874#issuecomment-1900967890
local my_find_files
my_find_files = function(opts, no_ignore)
	opts = opts or {}
	no_ignore = vim.F.if_nil(no_ignore, false)
	opts.attach_mappings = function(_, map)
		map({ "n", "i" }, "<C-h>", function(prompt_bufnr) -- <C-h> to toggle modes
			local prompt = require("telescope.actions.state").get_current_line()
			require("telescope.actions").close(prompt_bufnr)
			no_ignore = not no_ignore
			my_find_files({ default_text = prompt }, no_ignore)
		end)
		return true
	end

	if no_ignore then
		opts.no_ignore = true
		opts.hidden = true
		opts.prompt_title = "Find Files <ALL>"
		require("telescope.builtin").find_files(opts)
	else
		opts.prompt_title = "Find Files"
		require("telescope.builtin").find_files(opts)
	end
end
vim.keymap.set("n", "<leader>ff", my_find_files)

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
