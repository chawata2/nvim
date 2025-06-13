return {
	-- <C-CR>で囲い文字を抜ける
	"ysmb-wtsg/in-and-out.nvim",
	keys = {
		{
			"<C-CR>",
			function()
				require("in-and-out").in_and_out()
			end,
			mode = "i"
		},
	},
}
