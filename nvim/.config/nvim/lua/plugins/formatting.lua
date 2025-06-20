return {
	"stevearc/conform.nvim",
	dependencies = {
		"Hoffs/omnisharp-extended-lsp.nvim",
		"jlcrochet/vim-razor",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
        cs = { "csharpier" },
        css = { "prettier" },
				go = { "gofumpt" },
				html = { "prettier" },
        java = {"clang-format"},
				json = { "prettier" },
				jsx = { "prettier" },
				javascript = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "autopep8" },
				rust = { "rustfmt" },
				sh = { "beautysh" },
				typescript = { "prettier" },
				vue = { "prettier" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters = {
				csharpier = {
					command = "csharpier",
					args = { "format" },
				},
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format file with conform.nvim" })
	end,
}
