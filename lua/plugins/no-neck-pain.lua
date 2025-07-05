return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	opts = {
		width = 120,
		buffers = {
			background = "none",
		},
	},
	-- 起動時に自動で中央寄せ
	init = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function() require("no-neck-pain").enable() end
		})
	end
}
