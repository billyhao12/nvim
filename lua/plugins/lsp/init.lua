-- add pyright to lspconfig
local M = {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = require("plugins.lsp.servers"),
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "b0o/SchemaStore.nvim",
    version = false, -- last release is way too old
  },
  { "m-demare/hlargs.nvim", config = true },
  { "jose-elias-alvarez/typescript.nvim" },
  setup = require("plugins.lsp.setup"),
}

table.insert(M, require("plugins.lsp.mason"))
table.insert(M, require("plugins.lsp.null-ls"))

return M
