function nnoremap(rhs, lhs, desc)
  vim.keymap.set("n", rhs, lhs, { silent = true, noremap = true, desc = desc })
end

function inoremap(rhs, lhs, desc)
  vim.keymap.set("i", rhs, lhs, { silent = true, noremap = true, desc = desc })
end

-- disable search highlighting by pressing enter
nnoremap("<cr>", "<cmd>:nohlsearch<cr><cr>")

-- tab management
nnoremap("<C-Insert>", "<cmd>:tabnew<cr>", "New tab")
nnoremap("<C-Delete>", "<cmd>:tabclose<cr>", "Close tab")
inoremap("<C-Insert>", "<cmd>:tabnew<cr>", "New tab")
inoremap("<C-Delete>", "<cmd>:tabclose<cr>", "Close tab")

nnoremap("th", "<cmd>:tabfirst<cr>", "First tab")
nnoremap("tk", "<cmd>:tabnext<cr>", "Next tab")
nnoremap("tj", "<cmd>:tabprev<cr>", "Previous tab")
nnoremap("tl", "<cmd>:tablast<cr>", "Last tab")
nnoremap("tt", "<cmd>:tabedit<cr>", "New tab")
nnoremap("td", "<cmd>:tabclose<cr>", "Close tab")
nnoremap("tn", "<cmd>:tabmove -1<cr>", "Move tab next")
nnoremap("tm", "<cmd>:tabmove +1<cr>", "Move tab previous")
require("which-key").register({
  t = {
    name = "tabs", 
  },
})

-- window management
nnoremap("<C-S-Right>", "<cmd>:vertical resize -1<cr>", "Minimize window")
nnoremap("<C-S-Left>", "<cmd>:vertical resize +1<cr>", "Maximize window")

-- telescope
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>", "Find file")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>", "Grep")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>", "Find buffer")
nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>", "Find references (LSP)")
nnoremap("<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "Find symbols (LSP)")
nnoremap("<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>", "Find incoming calls (LSP)")
nnoremap("<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>", "Find outgoing calls (LSP)")
nnoremap("<leader>fi", "<cmd>Telescope lsp_implementations<cr>", "Find implementations (LSP)")
nnoremap("<leader>fx", "<cmd>Telescope diagnostics bufnr=0<cr>", "Find errors (LSP)")
require("which-key").register({
  f = {
    name = "find", 
  },
}, { prefix = "<leader>" })

-- trouble
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>", "Display errors")
nnoremap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", "Display workspace errors")
nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", "Display document errors")
require("which-key").register({
  x = {
    name = "errors", 
  },
}, { prefix = "<leader>" })

-- symbols-outline
nnoremap("<leader>o", "<cmd>SymbolsOutline<cr>", "Show symbols")

-- nvim-tree
nnoremap("<leader>nn", "<cmd>NvimTreeToggle<cr>", "Open file browser")
nnoremap("<leader>nf", "<cmd>NvimTreeFindFile<cr>", "Find in file browser")
require("which-key").register({
  n = {
    name = "files", 
  },
}, { prefix = "<leader>" })

-- vim-test
nnoremap("<leader>vt", "<cmd>TestNearest<cr>", "Test nearest")
nnoremap("<leader>vf", "<cmd>TestFile<cr>", "Test file")
nnoremap("<leader>vs", "<cmd>TestSuite<cr>", "Test suite")
nnoremap("<leader>vl", "<cmd>TestLast<cr>", "Test last")
nnoremap("<leader>vg", "<cmd>TestVisit<cr>", "Go to test")
require("which-key").register({
  v = {
    name = "test", 
  },
}, { prefix = "<leader>" })

-- nvim-dap
nnoremap("<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Set breakpoint")
nnoremap("<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Set conditional breakpoint")
nnoremap("<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Set log point")
nnoremap('<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear breakpoints")
nnoremap('<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', "List breakpoints")
require("which-key").register({
  b = {
    name = "breakpoints", 
  },
}, { prefix = "<leader>" })

nnoremap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>", "Continue")
nnoremap("<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", "Step over")
nnoremap("<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", "Step into")
nnoremap("<leader>do", "<cmd>lua require'dap'.step_out()<cr>", "Step out")
nnoremap('<leader>dd', "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect")
nnoremap('<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", "Terminate")
nnoremap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "Open REPL")
nnoremap("<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", "Run last")
nnoremap('<leader>di', function() require"dap.ui.widgets".hover() end, "Variables")
nnoremap('<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end, "Scopes")
nnoremap('<leader>df', '<cmd>Telescope dap frames<cr>', "List frames")
nnoremap('<leader>dh', '<cmd>Telescope dap commands<cr>', "List commands")
require("which-key").register({
  d = {
    name = "debug", 
  },
}, { prefix = "<leader>" })
