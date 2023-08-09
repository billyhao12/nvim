return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/which-key.nvim",
    keys = {
      { "<leader>wk", ":WhichKey<CR>", desc = "WhichKey" },
    },
  },
  {
    "echasnovski/mini.animate",
    enabled = false,
  },
  {
    "kkoomen/vim-doge",
    lazy = false,
    build = ":call doge#install()",
    keys = {
      { "gcd", ":DogeGenerate " },
    },
    init = function()
      -- Remove default mappings. We just want the generate mapping to gdd.
      vim.g.doge_enable_mappings = 0
      vim.keymap.set(
        "n",
        "gdd",
        "<Plug>(doge-generate)",
        { noremap = false, silent = true, desc = "Generate doc comment" }
      )
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>ut", ":UndotreeToggle<CR>", desc = "UndoTree" },
    },
  },
  -- { -- Make tokyonight transparent
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
}
