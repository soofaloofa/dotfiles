-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local remap = require("me.util").remap
local bufopts = { silent = true, noremap = true }

-- disable search highlighting by pressing enter
remap("n", "<cr>", "<cmd>:nohlsearch<cr><cr>")

-- use escape to close whatever overlay/list is currently open
local function close_overlays()
  if vim.api.nvim_win_get_config(0).relative ~= "" then
    vim.api.nvim_win_close(0, true)
    return
  end
  if vim.bo.filetype == "trouble" then
    vim.cmd("Trouble close")
    return
  end
  pcall(vim.cmd, "cclose")
  pcall(vim.cmd, "lclose")
end
remap("n", "<Esc>", close_overlays, bufopts, "Close popups/lists")

-- tab management
remap("n", "<C-Insert>", "<cmd>:tabnew<cr>", bufopts, "New tab")
remap("n", "<C-Delete>", "<cmd>:tabclose<cr>", bufopts, "Close tab")
remap("i", "<C-Insert>", "<cmd>:tabnew<cr>", bufopts, "New tab")
remap("i", "<C-Delete>", "<cmd>:tabclose<cr>", bufopts, "Close tab")

remap("n", "<leader>th", "<cmd>:tabfirst<cr>", bufopts, "First tab")
remap("n", "<leader>tj", "<cmd>:tabnext<cr>", bufopts, "Next tab")
remap("n", "<leader>tk", "<cmd>:tabprev<cr>", bufopts, "Previous tab")
remap("n", "<leader>tl", "<cmd>:tablast<cr>", bufopts, "Last tab")
remap("n", "<leader>tt", "<cmd>:tabedit<cr>", bufopts, "New tab")
remap("n", "<leader>td", "<cmd>:tabclose<cr>", bufopts, "Close tab")
remap("n", "<leader>tJ", "<cmd>:tabmove +1<cr>", bufopts, "Move tab later")
remap("n", "<leader>tK", "<cmd>:tabmove -1<cr>", bufopts, "Move tab earlier")

-- window management
remap("n", "<C-S-Right>", "<cmd>:vertical resize -1<cr>", bufopts, "Minimize window")
remap("n", "<C-S-Left>", "<cmd>:vertical resize +1<cr>", bufopts, "Maximize window")

-- formatting
remap("n", "Q", "gqap", bufopts, "Format paragraph")
remap("x", "Q", "gq", bufopts, "Format paragraph")
remap("n", "<leader>Q", "vapJgqap", bufopts, "Merge paragraphs")

--
-- Plugins
--

-- vim-marked
remap("n", "<leader>mo", "<cmd>MarkedOpen<cr>", bufopts, "Open marked")

-- vim-pencil
remap("n", "<leader>qc", "<Plug>ReplaceWithCurly", bufopts, "Curl quotes")
remap("n", "<leader>qs", "<Plug>ReplaceWithStraight", bufopts, "Straighten quotes")

-- telescope
remap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", bufopts, "Find file")
remap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", bufopts, "Grep")
remap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", bufopts, "Find buffer")
remap("n", "<leader>fm", "<cmd>Telescope marks<cr>", bufopts, "Find mark")

-- trouble
remap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", bufopts, "Display errors")
-- remap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", bufopts, "Display workspace errors")
-- remap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", bufopts, "Display document errors")

-- aerial
remap("n", "<leader>a", "<cmd>AerialToggle<cr>", bufopts, "Toggle symbols outline")

-- oil
remap("n", "<leader>n", "<cmd>Oil<cr>", bufopts, "Oil")

-- vim-test
remap("n", "<leader>vt", "<cmd>TestNearest<cr>", bufopts, "Test nearest")
remap("n", "<leader>vf", "<cmd>TestFile<cr>", bufopts, "Test file")
remap("n", "<leader>vs", "<cmd>TestSuite<cr>", bufopts, "Test suite")
remap("n", "<leader>vl", "<cmd>TestLast<cr>", bufopts, "Test last")
remap("n", "<leader>vg", "<cmd>TestVisit<cr>", bufopts, "Go to test")
