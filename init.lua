vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = "a"
vim.opt.title = true
vim.opt.helplang = "ja"
vim.opt.visualbell = true
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.o.number = true
-- vim.o.relativenumber = true
vim.opt.cursorline = true

-- keymap
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"EdenEast/nightfox.nvim",
		config = function()
			vim.cmd("colorscheme nightfox")
		end,
	},
	{
		"unblevable/quick-scope",
		init = function()
			vim.cmd("highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline")
			vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		config = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
})
