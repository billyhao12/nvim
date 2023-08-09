local nls = require("null-ls")

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = {
    sources = {
      -- nls.builtins.formatting.prettierd,
      nls.builtins.code_actions.refactoring,
      nls.builtins.code_actions.eslint,
      nls.builtins.formatting.black,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.beautysh,
      nls.builtins.diagnostics.ruff,
    },
  },
  config = true,
}
