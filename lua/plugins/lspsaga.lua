return
{
	'nvimdev/lspsaga.nvim',
	config = function()
		require('lspsaga').setup({
			lightbulb = {
				-- 電球を消す
				sign = false,
				virtual_text = false,
			}
		})
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter', -- optional
		'nvim-tree/nvim-web-devicons', -- optional
	}
}
