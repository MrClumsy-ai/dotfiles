-- project viewer (open nvim file explorer)
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- save and quit
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>")
vim.keymap.set("n", "<leader>q", "<CMD>q!<CR>")

-- center movement
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- move 10
-- vim.keymap.set("n", "J", "10jzz")
-- vim.keymap.set("n", "K", "10kzz")

-- move selected text with J or K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- C-c when in visual block mode, now does what i want it to do
vim.keymap.set("i", "<C-c>", "<Esc>")

-- tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- void register
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("v", "c", '"_c')
vim.keymap.set("n", "x", '"_x')

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- replace word selected
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>/", [[/<C-r><C-w><CR>]])
vim.keymap.set("v", "<leader>s", [[:s/\(.*\)/]]) -- fighting one eyed kirby moment

-- flop command
vim.keymap.set("n", "Q", "<nop>")

-- complete commands
vim.keymap.set("i", "(", "()<Esc>i")
vim.keymap.set("i", "[", "[]<Esc>i")
vim.keymap.set("i", "{", "{}<Esc>i")
vim.keymap.set("i", '"', '""<Esc>i')

-- language specific shortcuts
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
vim.keymap.set("n", "<leader>ed", "iexport default () => {<CR>}<Esc>Oreturn(<CR><Tab><><CR><Tab></><CR>)<Esc>")
vim.keymap.set("n", "<leader>egs", "{ get; set; }<Esc>")
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>")
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>")

--[[
-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gp", ":Git push<CR>")

-- harpoon
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end)

-- telescope
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git find files" })
vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string({search = vim.fn.input("Grep > ")})
end)

-- undoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- LSP
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
]]
