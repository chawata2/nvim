return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top"
				},
			},
		})
		pcall(require("telescope").load_extension, "fzf")

		local builtin = require("telescope.builtin")
		-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

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

		vim.keymap.set("n", "<leader>ff", my_find_files) -- you can then bind this to whatever you want
	end,
}
