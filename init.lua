-- Enable Lua module caching for faster startup (Optional)
if vim.loader then vim.loader.enable() end

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "
vim.g.python3_host_prog = 'C:/Users/ivan.kulikov/venv_nvim/Scripts/python.exe'



require("prepare_lazy")
require("lazy").setup("plugins")
require("config_plugins")
require("basic_settings")
require("keymaps")
require("snippets")

