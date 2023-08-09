return {
  "mfussenegger/nvim-dap",
  dependencies = {

    -- fancy UI for the debugger
    {
      "rcarriga/nvim-dap-ui",
      -- keys = require("plugins.dap.keymaps").ui,
      opts = require("plugins.dap.ui"),
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        -- dap.listeners.before.event_terminated["dapui_config"] = function()
        --   dapui.close()
        -- end
        -- dap.listeners.before.event_exited["dapui_config"] = function()
        --   dapui.close()
        -- end
      end,
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {
        display_callback = function(variable, buf, stackframe, node, options)
          if options.virt_text_pos == "inline" then
            return " = " .. variable.value
          else
            return variable.name .. " = " .. variable.value
          end
        end,
        -- virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
        virt_text_pos = "eol",
      },
    },

    {
      -- Messes up the Python debugger.
      "jay-babu/mason-nvim-dap.nvim",
      enabled = false,
    },

    {
      "mfussenegger/nvim-dap-python",
      config = function()
        local dappy = require("dap-python")
        dappy.setup("python")
        dappy.test_runner = "pytest"
      end,
    },
  },

  keys = require("plugins.dap.keymaps").core,
  config = require("plugins.dap.config"),
}
