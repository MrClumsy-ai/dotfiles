return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvimtools/none-ls.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim",
			"Issafalcon/neotest-dotnet",
		},
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"cssls",
					"gopls",
					"html",
					"htmx",
					"lua_ls",
					"pylsp",
					"rust_analyzer",
					"ts_ls",
				},
				handlers = {
					function(server_name)
						print("setting up", server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP get definition" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP get implementation" })
			vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "LSP get references" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, { desc = "LSP view diagnostics" })
		end,
	},
	{
		"seblyng/roslyn.nvim",
		ft = { "cs", "razor" },
		dependencies = {
			"tris203/rzls.nvim",
			config = true,
		},
		config = function()
			local cmd = {}
			vim.lsp.config("roslyn", {
				cmd = cmd,
				handlers = require("rzls.roslyn_handlers"),
				settings = {
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = true,
						csharp_enable_inlay_hints_for_implicit_variable_types = true,

						csharp_enable_inlay_hints_for_lambda_parameter_types = true,
						csharp_enable_inlay_hints_for_types = true,
						dotnet_enable_inlay_hints_for_indexer_parameters = true,
						dotnet_enable_inlay_hints_for_literal_parameters = true,
						dotnet_enable_inlay_hints_for_object_creation_parameters = true,
						dotnet_enable_inlay_hints_for_other_parameters = true,
						dotnet_enable_inlay_hints_for_parameters = true,
						dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
						dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
						dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
				},
			})
			vim.lsp.enable("roslyn")
		end,
		init = function()
			vim.filetype.add({
				extension = {
					razor = "razor",
					cshtml = "razor",
				},
			})
		end,
	},
}
