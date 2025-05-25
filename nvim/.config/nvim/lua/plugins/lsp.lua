return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"css_variables",
					"gopls",
					"html",
					"lua_ls",
					"pyright",
					"quick_lint_js",
					"rust_analyzer",
					"vuels",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local on_attach = function(_, _)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
				vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
			end
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.css_variables.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.gopls.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.html.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.quick_lint_js.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.vuels.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		end,
	},
	{ "nvimtools/none-ls.nvim" },
}
