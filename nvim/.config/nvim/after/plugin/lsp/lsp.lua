-- for knowing which one to install, do :help lspconfig-all
require("mason").setup()
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
local on_attatch = function(_, _)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
  vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
  vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  on_attach = on_attatch,
  capabilities = capabilities,
})

lspconfig.css_variables.setup({
  on_attach = on_attatch,
  capabilities = capabilities,
})

lspconfig.gopls.setup({
  on_attach = on_attatch,
  capabilities = capabilities,
})

lspconfig.html.setup({
  on_attach = on_attatch,
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  on_attatch = on_attatch,
  capabilities = capabilities,
})

lspconfig.pyright.setup({
  on_attach = on_attatch,
  capabilities = capabilities,
})

lspconfig.quick_lint_js.setup({
  on_attach = on_attatch,
  capabilities = capabilities,
})

lspconfig.vuels.setup({
  on_attach = on_attatch,
  capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
  on_attatch = on_attatch,
  capabilities = capabilities,
  filetypes = { "rust" },
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})
