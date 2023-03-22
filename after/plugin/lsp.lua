local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
--  suggest_lsp_servers = false,
})

lsp.setup_servers({'tsserver', 'eslint', 'sumneko_lua', 'rust_analyzer'})


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
