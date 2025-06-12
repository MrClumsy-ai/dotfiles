-- project viewer (open nvim file explorer)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- enter normal mode in terminal
vim.keymap.set("t", "<M-j>", "<c-\\><c-n>")

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
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move 10
-- vim.keymap.set("n", "J", "10jzz")
-- vim.keymap.set("n", "K", "10kzz")

-- move selected text with J or K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
vim.keymap.set("n", "<leader>ee", "iif err != nil {<CR>}<Esc>O")
vim.keymap.set("n", "<leader>ed", "iexport default () => {<CR>}<Esc>O")
--[[
-- plugin commands:
floaterminal
vim.keymap.set({"n", "t"}, "<leader>tt", toggle_terminal)

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

-- mason
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
]]
