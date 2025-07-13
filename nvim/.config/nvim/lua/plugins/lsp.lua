return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvimtools/none-ls.nvim",
		"Hoffs/omnisharp-extended-lsp.nvim",
		"Issafalcon/neotest-dotnet",
	},
	opts = {
		setup = {
			efm = {
				filetypes = { "cshtml" },
				settings = {
					rootMarkers = { ".git/" },
					languages = {
						razor = {
							{ formatCommand = "dotnet format --include ${INPUT}", formatStdin = false },
						},
						cshtml = {
							{ formatCommand = "dotnet format --include ${INPUT}", formatStdin = false },
						},
					},
				},
			},
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true)
				end
			end,
		})
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				-- "autopep8",
				"bashls",
				-- "beautysh",
				-- "clang-format",
				"clangd",
				-- "csharpier",
				"cssls",
				"css_variables",
				-- "gofumpt",
				"gopls",
				"html",
				"htmx",
				"lua_ls",
				"omnisharp",
				-- "prettier",
				"pylsp",
				-- "roslyn",
				"rust_analyzer",
				-- "rzls",
				-- "stylua",
				"templ",
				"ts_ls",
				"vuels",
			},
			handlers = {
				function(server_name)
					print("setting up", server_name)
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
					local opts = {
						capabilities = capabilities,
					}
					require("lspconfig")[server_name].setup(opts)
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
		vim.keymap.set("n", "<leader>ih", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { desc = "Toggle inlay hints" })
	end,
}
