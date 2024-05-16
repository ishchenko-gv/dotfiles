require('mason').setup()

require('mason-lspconfig').setup {
  ensure_installed = {
    'lua_ls',
    'quick_lint_js',
    'tsserver',
    'stylelint_lsp',
    'pyright',
    'sqlls',
    'marksman',
    'yamlls',
    'taplo'
  }
}

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.quick_lint_js.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.stylelint_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.taplo.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'htmldjango', 'ejs', 'javascript', 'typescript' },
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'htmldjango', 'ejs', 'javascript', 'typescript' },
  settings = {
    classAttributes = { "class", "className", "class:list", "classList", "ngClass" }
  }
}
