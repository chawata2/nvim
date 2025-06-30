return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		vim.opt.fillchars:append({
			foldopen  = "",
			foldclose = "",
			foldsep   = " ",
			fold      = " ",
		})
		require("statuscol").setup({
			segments = {
				-- { text = { "%C" },                  click = "v:lua.ScFa" },
				{ text = { builtin.foldfunc },      click = "v:lua.ScFa", }, -- Foldの描画を変更
				{ text = { "%s" },                  click = "v:lua.ScSa" },
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
			},
		})
		vim.o.foldcolumn = '1'
	end,
}
