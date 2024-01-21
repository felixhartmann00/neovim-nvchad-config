local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_dir = lspconfig.util.root_pattern('.clangd','.clang-tidy','.clang-format','compile_commands.json','compile_flags.txt','configure.ac','.git'),
}

lspconfig.jdtls.setup {
  cmd = { "jdtls" },
  filetypes = { "java" },
  init_options = {
    jvm_args = {},
    workspace = "/home/user/.cache/jdtls/workspace"
  },
  -- root_dir = lspconfig.util.root_pattern('./src/App.java'),
}

lspconfig.azure_pipelines_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "azure-pipelines-language-server", "--stdio" },
  filetypes = { "yaml" },
  settings = {
      yaml = {
          schemas = {
              ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                  "/azure-pipeline*.y*l",
                  "/*.azure*",
                  "Azure-Pipelines/**/*.y*l",
                  "Pipelines/*.y*l",
              },
          },
      },
  },
}

lspconfig.bashls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)"
    }
  }
}

lspconfig.csharp_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  init_options = {
    AutomaticWorkspaceInit = true
  },
}

lspconfig.dockerls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" },
  --root_dir = root_pattern("Dockerfile"),
}

lspconfig.fsautocomplete.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "fsautocomplete", "--adaptive-lsp-server-enabled" },
  filetypes = { "fsharp" },
  init_options = {
    AutomaticWorkspaceInit = true
  },
}

lspconfig.htmx.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "htmx-lsp" },
  filetypes = { "html" },
}

lspconfig.sqlls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql", "mysql" },
}

lspconfig.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
  hostInfo = "neovim"
},
  --root_dir = root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  init_options = {
    provideFormatter = true
  },
  --root_dir = root_pattern("package.json", ".git"),
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    },
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    provideFormatter = true
  },
}

