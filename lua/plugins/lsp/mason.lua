return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    -- JavaScript / Typescript
    table.insert(opts.ensure_installed, "js-debug-adapter")
    table.insert(opts.ensure_installed, "prettierd")
    table.insert(opts.ensure_installed, "eslint-lsp")
    table.insert(opts.ensure_installed, "typescript-language-server")
    table.insert(opts.ensure_installed, "json-lsp")
    -- Python
    table.insert(opts.ensure_installed, "pyright")
    table.insert(opts.ensure_installed, "ruff")
    table.insert(opts.ensure_installed, "black")
    table.insert(opts.ensure_installed, "debugpy")
    -- Bash
    table.insert(opts.ensure_installed, "bash-language-server")
    table.insert(opts.ensure_installed, "beautysh")
    -- Lua
    table.insert(opts.ensure_installed, "lua-language-server")
    table.insert(opts.ensure_installed, "stylua")
    -- Other
    table.insert(opts.ensure_installed, "marksman")
    table.insert(opts.ensure_installed, "terraform-ls")
    table.insert(opts.ensure_installed, "tflint")
    table.insert(opts.ensure_installed, "yaml-language-server")
  end,
}
