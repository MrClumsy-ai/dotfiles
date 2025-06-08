return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "autopep8" },
				go = { "gofumpt" },
				c = { "clang-format" },
				bash = { "beautysh" },
				cs = { "clang-format" },
				["_"] = { "prettier" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- format_on_save = {
			-- 	timeout_ms = 500,
			-- 	lsp_fallback = true,
			-- },
		})
		vim.keymap.set("n", "<leader>gf", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format file with conform.nvim" })
	end,
}
