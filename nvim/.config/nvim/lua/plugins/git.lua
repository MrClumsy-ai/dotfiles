return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
			vim.keymap.set("n", "<leader>gP", ":Git pull --rebase<CR>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "_" },
				changedelete = { text = "~" },
			},
		},
	},
}
