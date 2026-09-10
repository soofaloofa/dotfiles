-- LSP Configuration
local remap = require('me/util').remap
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Consolidate LSP navigation under Neovim's built-in gr*-prefixed keymaps.
-- Keeps grn (rename) and gra (code action) as core defaults, but backs
-- reference/implementation/type/symbol/call-hierarchy lookups with Telescope
-- pickers instead of the default quickfix list, and adds definition/declaration
-- (grd/grD) to simulate ctags' jump-to-definition.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-gr-keymaps', { clear = true }),
  callback = function(args)
    local bufopts = { buffer = args.buf, silent = true, noremap = true }
    remap("n", "grd", vim.lsp.buf.definition, bufopts, "Go to definition")
    remap("n", "grD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
    remap("n", "grr", "<cmd>Telescope lsp_references<cr>", bufopts, "Find references")
    remap("n", "gri", "<cmd>Telescope lsp_implementations<cr>", bufopts, "Find implementations")
    remap("n", "grt", "<cmd>Telescope lsp_type_definitions<cr>", bufopts, "Find type definitions")
    remap("n", "grs", "<cmd>Telescope lsp_document_symbols<cr>", bufopts, "Find document symbols")
    remap("n", "grc", "<cmd>Telescope lsp_incoming_calls<cr>", bufopts, "Find incoming calls")
    remap("n", "gro", "<cmd>Telescope lsp_outgoing_calls<cr>", bufopts, "Find outgoing calls")
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
