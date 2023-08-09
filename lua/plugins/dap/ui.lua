local side_panel_size = 1 / 3

local M = {
  icons = {
    expanded = "",
    collapsed = "",
    current_frame = "▸",
  },
  controls = {
    element = "scopes",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = "",
    },
  },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
  },
  layouts = {
    {
      elements = {
        -- {
        --   id = "repl",
        --   size = 0.15,
        -- },
        {
          id = "breakpoints",
          size = side_panel_size,
        },
        {
          id = "stacks",
          size = side_panel_size,
        },
        {
          id = "watches",
          size = side_panel_size,
        },
      },
      position = "right",
      size = 65,
    },
    {
      elements = {
        {
          id = "scopes",
          size = 0.5,
        },
        {
          id = "console",
          size = 0.5,
        },
      },
      position = "bottom",
      size = 20,
    },
  },
}

return M
