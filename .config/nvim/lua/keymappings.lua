-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope metals commands<cr>",
  {silent = true, noremap = true}
)

-- trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

-- symbols-outline
vim.keymap.set("n", "<leader>tb", "<cmd>SymbolsOutline<cr>",
  {silent = true, noremap = true}
)

-- nvim-tree
vim.keymap.set("n", "<leader>nn", "<cmd>NvimTreeToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>",
  {silent = true, noremap = true}
)
