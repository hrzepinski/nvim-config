require('telescope').setup({
    defaults = {
        path_display = {
            "truncate"
        },
        layout_config = {
            vertical = { width = 0.1 }
        },
    },
})

local builtin = require('telescope.builtin')

--vim.keymap.set('n', '<leader>ff', "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
--    { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fL', function ()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fl', builtin.live_grep, {});
