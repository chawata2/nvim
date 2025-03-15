return {
	"unblevable/quick-scope",
	init = function()
		vim.cmd("highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline")
		vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
	end,
}