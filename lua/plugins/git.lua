local M = {
  {
    "tpope/vim-fugitive",
    dependencies = { "sindrets/diffview.nvim" },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      numhl = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%m-%d-%Y> - <summary>",
    },
  },
}

return M
