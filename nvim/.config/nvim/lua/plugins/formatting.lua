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
				sh = { "beautysh" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				cs = { "csharpier" },
				cshtml = { "csharpier" },
				go = { "gofumpt" },
				lua = { "stylua" },
				python = { "autopep8" },
				rust = { "rustfmt" }, -- rustup component add rustfmt-latest
				["_"] = { "prettier" },
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
