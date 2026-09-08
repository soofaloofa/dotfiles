local remap = require("me.util").remap

require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local bufopts = { silent = true, noremap = true, buffer = bufnr }

    remap('n', ']h', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gitsigns.next_hunk() end)
      return '<Ignore>'
    end, vim.tbl_extend('force', bufopts, { expr = true }), "Next hunk")

    remap('n', '[h', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gitsigns.prev_hunk() end)
      return '<Ignore>'
    end, vim.tbl_extend('force', bufopts, { expr = true }), "Previous hunk")

    remap('n', '<leader>hs', gitsigns.stage_hunk, bufopts, "Stage hunk")
    remap('n', '<leader>hr', gitsigns.reset_hunk, bufopts, "Reset hunk")
    remap('n', '<leader>hp', gitsigns.preview_hunk, bufopts, "Preview hunk")
    remap('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end, bufopts, "Blame line")
  end,
})
