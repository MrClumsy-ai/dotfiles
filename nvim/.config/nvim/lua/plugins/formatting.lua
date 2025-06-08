return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "pylsp" },
        go = { "gofumpt" },
        c = { "ast-grep" },
        bash = { "beautysh" },
        ["*"] = { "prettier" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- format_on_save = {
      -- 	timeout_ms = 500,
      -- 	lsp_fallback = true,
      -- },
    })
    vim.keymap.set('n', '<leader>gf', function()
      require('conform').format({ async = true, lsp_fallback = true })
    end, { desc = 'Format file with conform.nvim' })
  end,
}
