-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

local M = {
  augroup = vim.api.nvim_create_augroup("fugitive_config", {}),
}

---Get the script ID of a fugitive script file.
---@return integer?
function M.get_sid()
  local file = "autoload/fugitive.vim"
  local script_entry = vim.api.nvim_exec2("filter #vim-fugitive/" .. file .. "# scriptnames", { output = true })
  -- local s = ""
  -- local script_match = script_entry.output.match("^(%d+)")
  -- print("Got the script entry output: " .. script_entry.output)
  local output = script_entry.output
  -- local i, j = string.find(output, "^ (%d+)")
  local match = string.match(output, "^ (%d+)")
  -- print("Got the i and j: " .. i .. " " .. j)
  print("Got the i and j: " .. match)
  -- local id = output.sub(i, j)
  -- print("Got the id: " .. id)
  return tonumber(match) --[[@as integer ]]
end

---Get the fugitive context for the item under the cursor.
---@return table?
function M.get_info_under_cursor()
  if vim.bo.ft ~= "fugitive" then
    return
  end
  local sid = M.get_sid()

  print("Got the sid: " .. sid)
  if sid then
    return vim.call(("<SNR>%d_StageInfo"):format(sid), vim.api.nvim_win_get_cursor(0)[1])
  end
end

vim.api.nvim_create_autocmd("FileType", {
  group = M.augroup,
  pattern = "fugitive",
  callback = function(ctx)
    -- Open Diffview for the item under the cursor
    vim.keymap.set("n", "D", function()
      local info = M.get_info_under_cursor()

      if info then
        if #info.paths > 0 then
          vim.cmd(("DiffviewOpen --selected-file=%s"):format(vim.fn.fnameescape(info.paths[1])))
        elseif info.commit ~= "" then
          vim.cmd(("DiffviewOpen %s^!"):format(info.commit))
        end
      end
    end, { buffer = ctx.buf })
  end,
})
