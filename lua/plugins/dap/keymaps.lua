local M = {
  core = {
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "DAP: Toggle Breakpoint",
    },
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "DAP: Continue",
    },
    {
      "<F7>",
      function()
        require("dap").step_into()
      end,
      desc = "DAP: Step Into",
    },
    {
      "<F9>",
      function()
        require("dap").step_out()
      end,
      desc = "DAP: Step Out",
    },
    {
      "<F8>",
      function()
        require("dap").step_over()
      end,
      desc = "DAP: Step Over",
    },
    {
      "<F10>",
      function()
        require("dap").terminate()
      end,
      desc = "DAP: Terminate",
    },
  },
}

return M
