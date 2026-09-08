-- LSP Configuration
local remap = require('me/util').remap
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Extend Neovim's built-in gr*-prefixed LSP keymaps (grn, gra, grr, gri, grt, gO)
-- with go-to-definition/declaration, to simulate ctags' jump-to-definition.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-gr-keymaps', { clear = true }),
  callback = function(args)
    local bufopts = { buffer = args.buf, silent = true, noremap = true }
    remap("n", "grd", vim.lsp.buf.definition, bufopts, "Go to definition")
    remap("n", "grD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
  end,
})

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
