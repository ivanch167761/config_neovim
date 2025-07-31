-- lua/config/toggleterm_git.lua
local Terminal  = require("toggleterm.terminal").Terminal

-- Define a floating terminal running lazygit
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border   = "double",
    winblend = 5,
  },
})

-- Toggle function
function _lazygit_toggle()
  lazygit:toggle()
end

-- Map the toggle to <leader>gg
vim.api.nvim_set_keymap(
  "n",
  "<leader>gg",
  "<cmd>lua _lazygit_toggle()<CR>",
  { noremap = true, silent = true }
)
