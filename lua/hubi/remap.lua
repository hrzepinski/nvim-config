vim.g.mapleader = " ";
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", "<C-W><C-W>")

vim.keymap.set("n", ":W", ":w")
vim.keymap.set("n", "<S-Y>", "yaw") -- yank word under cursor

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", ":m .+1<CR>==")
vim.keymap.set("n", "K", ":m .-2<CR>==")

vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<", "gT")
vim.keymap.set("n", ">", "gt")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("v", "_", "g_")
vim.keymap.set("n", "_", "g_")

vim.keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context()
end, { silent = true })


vim.keymap.set("n", "<F5>", "!cd %:p:h && npm run test --filter %<CR>")
