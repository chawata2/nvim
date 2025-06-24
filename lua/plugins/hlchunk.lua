return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				duration = 100,
				delay = 50
			},
			indent = {
				enable = true
			}
		})
	end
}
