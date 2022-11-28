local home = os.getenv('HOME')
local jdtls = require('jdtls')
local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

function nnoremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  jdtls.setup_dap({ hotcodereplace = 'auto' })
  jdtls.setup.add_commands()

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  nnoremap('gD', vim.lsp.buf.declaration, bufopts, "Go to declaration")
  nnoremap('gd', vim.lsp.buf.definition, bufopts, "Go to definition")
  nnoremap('gi', vim.lsp.buf.implementation, bufopts, "Go to implementation")
  nnoremap('K', vim.lsp.buf.hover, bufopts, "Hover text")
  nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts, "Show signature")
  nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
  nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
  nnoremap('<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts, "List workspace folders")
  nnoremap('<space>D', vim.lsp.buf.type_definition, bufopts, "Go to type definition")
  nnoremap('<space>rn', vim.lsp.buf.rename, bufopts, "Rename")
  nnoremap('<space>ca', vim.lsp.buf.code_action, bufopts, "Code actions")
  vim.keymap.set('v', "<space>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>", 
    { noremap=true, silent=true, buffer=bufnr, desc = "Code actions" })
  nnoremap('<space>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")

  -- Java extensions
  nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
  nnoremap("<leader>vc", jdtls.test_class, bufopts, "Test class (DAP)")
  nnoremap("<leader>vm", jdtls.test_nearest_method, bufopts, "Test method (DAP)")
  nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
  nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
  vim.keymap.set('v', "<space>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], 
    { noremap=true, silent=true, buffer=bufnr, desc = "Extract method" })
end

local bundles = {
  vim.fn.glob(home .. '/Projects/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar'),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. '/Projects/vscode-java-test/server/*.jar'), "\n"))

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local config = {
  flags = {
    debounce_text_changes = 80,
  },
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    bundles = bundles
  },
  settings = {
    java = {
      format = {
        settings = {
          url = "/.local/share/eclipse/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999;
          staticStarThreshold = 9999;
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = home .. "/.asdf/installs/java/corretto-11.0.16.9.1",
          },
          {
            name = "JavaSE-17",
            path = home .. "/.asdf/installs/java/corretto-17.0.4.9.1",
          },
          {
            name = "JavaSE-1.8",
            path = home .. "/.asdf/installs/java/corretto-8.352.08.1"
          },
        }
      }
    }
  },
  cmd = {
    home .. "/.asdf/installs/java/corretto-17.0.4.9.1/bin/java",
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. home .. '/.local/share/eclipse/lombok.jar',
    '-jar', vim.fn.glob('/opt/homebrew/Cellar/jdtls/1.17.0/libexec/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration', '/opt/homebrew/Cellar/jdtls/1.17.0/libexec/config_mac',
    '-data', workspace_folder,
  },
}

jdtls.start_or_attach(config)
