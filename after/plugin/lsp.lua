local lsp = require('lsp-zero').preset({
    name = 'recommended',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

--lsp.setup_servers({ 'eslint', 'tsserver', 'rust_analyzer' })

lsp.nvim_workspace()

vim.diagnostic.config({
    signs = true,
    update_in_insert = false,
    underline = true,
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
        severity = { min = vim.diagnostic.severity.ERROR }
    },
    severity_sort = true,
    float = {
        source = "always", -- Or "if_many"
    },
})



lsp.set_preferences({
    sign_icons = {}
})


lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "I", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)


    if client.server_capabilities.documentFormattingProvider then
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --     callback = function()
        --         vim.lsp.buf.format {
        --             filter = function(client) return client.name ~= "tsserver" end
        --         }
        --     end
        -- })
        if client.name == "tsserver" then --
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
            })
        end
    end
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['tsserver'] = { 'typescript' },
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
    }
})

lsp.setup()

local cmp = require('cmp')

-- local cmp_select = { behaviour = cmp.SelectBehavior.Select }

--local cmp_mappings = lsp.defaults.cmp_mappings({
--    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--    ['<CR>'] = cmp.mapping.confirm({ select = true }),
--    ['<C-Space>'] = cmp.mapping.complete(),
--})

cmp.setup({
    selection = cmp.SelectBehavior.Select,
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }
})
