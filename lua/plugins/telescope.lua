return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  keys = {
    { "<leader>ff", require("telescope.builtin").find_files, desc = "[F]ind [F]iles" },
    { "<leader>fk", require("telescope.builtin").keymaps, desc = "[F]ind [K]eymaps" },
    { "<leader>ft", require("telescope.builtin").live_grep, desc = "[F]ind [T]ext" },
    { "<leader>sd", require("telescope.builtin").diagnostics, desc = "[S]earch [D]iagnostics" },
    { "<leader>sg", require("telescope.builtin").git_files, desc = "[S]earch [G]it" },
    { "<leader>sc", require("telescope.builtin").git_commits, desc = "[S]earch Git [C]ommits" },
    { "<leader>sb", require("telescope.builtin").buffers, desc = "[S]earch [B]uffers" },
    { "<leader>gb", require("telescope.builtin").git_branches, desc = "Git Branches" },
    { "<leader>jl", require("telescope.builtin").jumplist, desc = "Telescope Jumplist" },
  },
}
