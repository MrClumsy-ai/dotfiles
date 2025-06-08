return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("mason").setup()
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
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
	end,
}
