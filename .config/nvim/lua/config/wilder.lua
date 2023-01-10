local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
wilder.set_option('use_python_remote_plugin', 0)
wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline(),
    wilder.search_pipeline()
  ),
})
wilder.set_option('renderer', wilder.wildmenu_renderer({
  highlighter = wilder.basic_highlighter(),
}))
