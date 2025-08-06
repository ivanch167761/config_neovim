-- File: lua/basic_settings/init.lua

-- General options
vim.opt.hlsearch = false                    -- Don't highlight search matches after searching
vim.opt.incsearch = true                    -- Show match while typing (useful if hlsearch is off)
vim.opt.number = true                       -- Show line numbers
vim.opt.relativenumber = true              -- Use relative line numbers (optional, preferred by many)
vim.opt.conceallevel = 1                    -- Useful for markdown, JSON, etc.
vim.opt.mouse = "a"                         -- Enable mouse support
vim.opt.clipboard = "unnamedplus"          -- Sync system clipboard
vim.opt.breakindent = true                 -- Indent wrapped lines visually
vim.opt.undofile = true                    -- Persistent undo

-- Search
vim.opt.ignorecase = true                  -- Case-insensitive unless capital letters used
vim.opt.smartcase = true

-- UI
vim.opt.signcolumn = "yes"                 -- Always show the sign column
vim.opt.termguicolors = true               -- Use GUI colors in the terminal
vim.opt.cursorline = true                  -- Highlight the current line (optional)
vim.opt.scrolloff = 8                      -- Keep 8 lines visible above/below cursor (optional)

-- Performance
vim.opt.updatetime = 250                   -- Faster cursor hold events (like CursorHold)
vim.opt.timeoutlen = 300                   -- Shorter key timeout for mapped sequences

-- Completion
vim.opt.completeopt = { "menuone", "noselect" }

-- Yank highlight
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- Optional:
-- Use system file encoding
--vim.opt.encoding = "utf-8"
--vim.opt.fileencoding = "utf-8"



local group = vim.api.nvim_create_augroup("SetFileEncoding", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = group,
  pattern = "*",
  callback = function()
    if vim.bo.modifiable then
      vim.bo.fileencoding = "utf-8"
    end
  end,
})
