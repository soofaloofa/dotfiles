local config = require("lsp.java").make_jdtls_config()
require("jdtls").start_or_attach(config)
