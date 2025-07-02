return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua             = { "stylua" },
			graphql         = { "prettier" },
			javascript      = { "prettier" },
			javascriptreact = { "prettier" },
			typescript      = { "prettier" },
			typescriptreact = { "prettier" },
			json            = { "prettier" },
			css             = { "stylelint" },
			scss            = { "stylelint" },
			sass            = { "stylelint" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
