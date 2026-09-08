require('aerial').setup({
  backends = { 'lsp', 'treesitter', 'markdown', 'man' },
  layout = {
    default_direction = 'right',
  },
  attach_mode = 'window',
})

pcall(require('telescope').load_extension, 'aerial')
