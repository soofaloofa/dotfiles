function nnoremap(rhs, lhs)
  vim.keymap.set("n", rhs, lhs, { silent = true, noremap = true })
end

function inoremap(rhs, lhs)
  vim.keymap.set("i", rhs, lhs, { silent = true, noremap = true })
end

-- Disable search highlighting by pressing enter
nnoremap("<cr>", "<cmd>:nohlsearch<cr><cr>")

-- Tab management
nnoremap("<C-t>", "<cmd>:tabnew<cr>")
nnoremap("<C-Delete>", "<cmd>:tabclose<cr>")
inoremap("<C-t>", "<cmd>:tabnew<cr>")
inoremap("<C-Delete>", "<cmd>:tabclose<cr>")

-- telescope
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("<leader>fm", "<cmd>Telescope metals commands<cr>")

-- trouble
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nnoremap("<leader>xr", "<cmd>TroubleToggle lsp_references<cr>")

-- symbols-outline
nnoremap("<leader>tb", "<cmd>SymbolsOutline<cr>")

-- nvim-tree
nnoremap("<leader>nn", "<cmd>NvimTreeToggle<cr>")
nnoremap("<leader>nf", "<cmd>NvimTreeFindFile<cr>")

-- vim-test
nnoremap("<leader>t", "<cmd>TestNearest<cr>")
nnoremap("<leader>T", "<cmd>TestFile<cr>")
nnoremap("<leader>a", "<cmd>TestSuite<cr>")
nnoremap("<leader>l", "<cmd>TestLast<cr>")
nnoremap("<leader>g", "<cmd>TestVisit<cr>")
