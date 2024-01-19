local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "pyright",
        "azure-pipelines-language-server",
        "bash-language-server",
        "csharp-language-server",
        "clangd",
        "css-lsp",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "fsautocomplete",
        "htmx-lsp",
        "html-lsp",
        "haskell-language-server",
        "java-language-server",
        "typescript-language-server",
        "sqlls",
      }
    }
  },
  {
    "ThePrimeagen/vim-be-good"
  }
}

return plugins

