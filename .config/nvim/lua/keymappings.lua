function nnoremap(rhs, lhs)
  vim.keymap.set("n", rhs, lhs, { silent = true, noremap = true })
end

function inoremap(rhs, lhs)
  vim.keymap.set("i", rhs, lhs, { silent = true, noremap = true })
end

-- disable search highlighting by pressing enter
nnoremap("<cr>", "<cmd>:nohlsearch<cr><cr>")

-- tab management
nnoremap("<C-Insert>", "<cmd>:tabnew<cr>")
nnoremap("<C-Delete>", "<cmd>:tabclose<cr>")
inoremap("<C-Insert>", "<cmd>:tabnew<cr>")
inoremap("<C-Delete>", "<cmd>:tabclose<cr>")

nnoremap("th", "<cmd>:tabfirst<cr>")
nnoremap("tk", "<cmd>:tabnext<cr>")
nnoremap("tj", "<cmd>:tabprev<cr>")
nnoremap("tl", "<cmd>:tablast<cr>")
nnoremap("tt", "<cmd>:tabedit<cr>")
nnoremap("tn", "<cmd>:tabmove -1<cr>")
nnoremap("tm", "<cmd>:tabmove +1<cr>")
nnoremap("td", "<cmd>:tabclose<cr>")

-- window management
nnoremap("<C-S-Right>", "<cmd>:vertical resize -1<cr>")
nnoremap("<C-S-Left>", "<cmd>:vertical resize +1<cr>")

-- telescope
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("<leader>ft", "<cmd>Telescope tags<cr>")
nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>")
nnoremap("<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>")
nnoremap("<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>")
nnoremap("<leader>fi", "<cmd>Telescope lsp_implementations<cr>")
nnoremap("<leader>fd", "<cmd>Telescope lsp_definitions<cr>")
nnoremap("<leader>fx", "<cmd>Telescope diagnostics bufnr=0<cr>")

-- trouble
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nnoremap("<leader>xr", "<cmd>TroubleToggle lsp_references<cr>")

-- symbols-outline
nnoremap("<leader>o", "<cmd>SymbolsOutline<cr>")

-- nvim-tree
nnoremap("<leader>nn", "<cmd>NvimTreeToggle<cr>")
nnoremap("<leader>nf", "<cmd>NvimTreeFindFile<cr>")

-- vim-test
nnoremap("<leader>tt", "<cmd>TestNearest<cr>")
nnoremap("<leader>tf", "<cmd>TestFile<cr>")
nnoremap("<leader>ts", "<cmd>TestSuite<cr>")
nnoremap("<leader>tl", "<cmd>TestLast<cr>")
nnoremap("<leader>tg", "<cmd>TestVisit<cr>")
nnoremap("<leader>tat", "<cmd>TestNearest -DfailIfNoTests=false -Dspotbugs.skip=true -Dfindbugs.skip=true -Dcheckstyle.skip=true -am<cr>")
nnoremap("<leader>taf", "<cmd>TestFile -DfailIfNoTests=false -Dspotbugs.skip=true -Dfindbugs.skip=true -Dcheckstyle.skip=true -am<cr>")

-- nvim-dap
nnoremap("<F5>", "<cmd>lua require'dap'.continue()<cr>")
nnoremap("<F10>", "<cmd>lua require'dap'.step_over()<cr>")
nnoremap("<F11>", "<cmd>lua require'dap'.step_into()<cr>")
nnoremap("<F12>", "<cmd>lua require'dap'.step_out()<cr>")
nnoremap("<Leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
nnoremap("<Leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
nnoremap("<Leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
nnoremap("<Leader>dr", "<cmd>lua require'dap'.repl.open()<cr>")
nnoremap("<Leader>dl", "<cmd>lua require'dap'.run_last()<cr>")

