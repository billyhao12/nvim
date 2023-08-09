local M = {}

M.setup = function()
  local dap = require("dap")
  if not dap.configurations.python then
    dap.configurations.python = {}
  end
  dap.set_log_level("ERROR")

  table.insert(dap.configurations.python, {
    name = "Run module",
    type = "python",
    request = "launch",
    module = function()
      local module = vim.fn.input("Module name: ")
      return module
    end,
    -- jinja = true,
    justMyCode = true,
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
  })
end

return M
