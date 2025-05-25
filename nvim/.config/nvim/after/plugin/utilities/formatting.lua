require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		markdown = { "prettier" },
		python = { "autopep8" },
		go = { "gofumpt" },
		c = { "ast-grep" },
	},

	-- Enable auto-formatting on save
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true, -- Fallback to LSP if no formatter is available
	},
})
