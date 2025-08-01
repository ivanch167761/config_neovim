-- Enable Lua module caching for faster startup (Optional)
if vim.loader then vim.loader.enable() end

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "


-- Detect OS and choose correct venv path
local home = os.getenv("USERPROFILE") or os.getenv("HOME")
local venv_python
if vim.loop.os_uname().sysname == "Windows_NT" then
  print(vim.loop.os_uname().sysname)
  venv_python = home .. "/venv_nvim/Scripts/python.exe"
else
  venv_python = home .. "/venv_nvim/bin/python"
end
vim.g.python3_host_prog = venv_python




require("prepare_lazy")
require("lazy").setup("plugins")
require("config_plugins")
require("basic_settings")
require("keymaps")
require("snippets")

