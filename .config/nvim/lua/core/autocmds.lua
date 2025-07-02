-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup       -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd       -- Create autocommand
local usercmd = vim.api.nvim_create_user_command   -- Create usercommand

-- General settings:
--------------------

-- use Open instead of netrw
usercmd(
  'Browse',
  "silent execute '!open' shellescape(<q-args>,1)",
  { nargs = 1, bang = true }
)

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.hl.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

--

-- -- Don't auto comment new lines
-- autocmd('BufEnter', {
--   pattern = '',
--   command = 'set fo-=c fo-=r fo-=o'
-- })

-- Terminal settings:
---------------------

-- Open a Terminal on the right tab
-- autocmd('CmdlineEnter', {
--   command = 'command! Term :botright vsplit term://$SHELL'
-- })

-- Enter insert mode when switching to terminal
-- autocmd('TermOpen', {
--   command = 'setlocal listchars= nonumber norelativenumber nocursorline',
-- })
--
-- autocmd('TermOpen', {
--   pattern = '',
--   command = 'startinsert'
-- })

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})

-- Language settings:
---------------------
autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
})
