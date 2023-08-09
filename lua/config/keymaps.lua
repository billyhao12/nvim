--[[
-- General keymaps. Not plugin specific.
--]]
local opts = { remap = false, silent = true }
local Util = require("lazyvim.util")
local set = vim.keymap.set
vim.g.mapleader = " "

set("n", "<leader>cg", ":e ~/.config/nvim<CR>", { desc = "[C]onfig" })
set("n", "<leader>sf", vim.cmd.write, { desc = "[S]ave [F]ile", noremap = true })
set("n", "<leader>fa", vim.cmd.EslintFixAll, { desc = "Eslint [F]ix [A]ll" })
set("n", "<leader>fm", vim.lsp.buf.format, { desc = "[F]or[m]at" })

-- Resize window
set("n", "<C-Up>", ":resize -2<CR>", opts)
set("n", "<C-Down>", ":resize +2<CR>", opts)
set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
set("n", "<S-l>", ":bnext<CR>", opts)
set("n", "<S-h>", ":bprevious<CR>", opts)
set("n", "<S-q>", function()
  if Util.has("mini.bufremove") then
    require("mini.bufremove").delete(vim.fn.bufnr(), false)
  else
    vim.cmd("bd")
  end
end, { desc = "Close current buffer.", noremap = true, silent = true })
set("n", "<leader><S-q>", ":silent %bd|e#|bd#<CR>", { desc = "Close all but current buffer." })
-- Tabs
set("n", "<A-l>", ":tabnext<CR>", opts)
set("n", "<A-h>", ":tabprevious<CR>", opts)

-- Clear highlights
set("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Indenting (Not sure I need this anymore.)
-- set("n", "<leader><Tab>", ">>_", { desc = "Indent line", noremap = true })
-- set("n", "<S-Tab>", "<<_", { desc = "Undent line", noremap = true })
-- set("v", "<Tab>", ">gv", { desc = "Indent block", noremap = true })
-- set("v", "<S-Tab>", "<gv", { desc = "Undent block", noremap = true })

set("n", "<C-u>", "<C-u>zz", { desc = "Better page up. Not disorientating.", noremap = true })
set("n", "<C-d>", "<C-d>zz", { desc = "Better page down. Not disorientating.", noremap = true })

-- Editor tricks
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block up" })
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block down" })
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("i", "<C-k>", "<Up>", { desc = "Fast upward cursor movement in INSERT MODE." })
set("i", "<C-j>", "<Down>", { desc = "Fast downward cursor movement in INSERT MODE." })
set("i", "<C-h>", "<Left>", { desc = "Fast leftward cursor movement in INSERT MODE." })
set("i", "<C-l>", "<Right>", { desc = "Fast rightward cursor movement in INSERT MODE." })

if not Util.has("vim-tmux-navigator") then
  set("n", "<C-k>", "<C-w>k", { desc = "Fast upward pane movement.", remap = false })
  set("n", "<C-j>", "<C-w>j", { desc = "Fast downward pane movement.", remap = false })
  set("n", "<C-h>", "<C-w>h", { desc = "Fast leftward pane movement.", remap = false })
  set("n", "<C-l>", "<C-w>l", { desc = "Fast rightward pane movement.", remap = false })
else
  -- Have to set these here otherwise fighting LazyVim defaults.
  set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Fast leftward pane movement.", remap = false, silent = true })
  set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Fast downward pane movement.", remap = false, silent = true })
  set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Fast upward pane movement.", remap = false, silent = true })
  set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Fast rightward pane movement.", remap = false, silent = true })
end

-- Better paste
set("x", "p", '"_dP', opts)

set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left>]])

-- Diagnostics
set("n", "<leader>e", vim.diagnostic.open_float)
set("n", "<leader>q", vim.diagnostic.setloclist)

set("n", "<leader>wk", ":WhichKey<CR>", opts)

-- Terminal Mode
set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode", noremap = true })

-- Git
set("n", "[g", "<cmd>diffget //2<CR>", { desc = "Git Leftside diff." })
set("n", "]g", "<cmd>diffget //3<CR>", { desc = "Git Rightside diff." })
