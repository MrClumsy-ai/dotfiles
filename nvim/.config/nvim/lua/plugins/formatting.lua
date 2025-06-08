return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
        bash = { "beautysh" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        cs = { "clang-format" },
        go = { "gofumpt" },
        lua = { "stylua" },
        python = { "autopep8" },
        rust = {"rustfmt"}, -- rustup component add rustfmt-latest
				["_"] = { "prettier" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format file with conform.nvim" })
	end,
}
