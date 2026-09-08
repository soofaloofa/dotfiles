-- LSP Configuration
local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config('gopls', {
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  }
})
vim.lsp.enable('gopls')

vim.lsp.config('pyright', {
  capabilities = capabilities,
  settings = {
    pyright = {
      analysis = {
        useLibraryCodeForTypes = true,
      },
    },
  }
})
vim.lsp.enable('pyright')

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
})
vim.lsp.enable('rust_analyzer')

vim.lsp.config('ts_ls', {
  capabilities = capabilities,
})
vim.lsp.enable('ts_ls')
