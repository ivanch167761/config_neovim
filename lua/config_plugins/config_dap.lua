local dap = require("dap")
local dapui = require("dapui")
local Hydra = require("hydra")
require("dap-python").setup("C:/Users/ivan.kulikov/venv_nvim/Scripts/python.exe")


local function get_python_path()
  local local_venv = vim.loop.cwd() .. "/venv/Scripts/python.exe"
  if vim.fn.filereadable(local_venv) == 1 then
    return local_venv
  end
  return "C:/Users/ivan.kulikov/venv_nvim/Scripts/python.exe"
end


require("dap-python").resolve_python = get_python_path




-- Adapter
dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    local port = (config.connect or config).port or 5678
    local host = (config.connect or config).host or "127.0.0.1"
    cb({ type = "server", port = port, host = host, options = { source_filetype = "python" } })
  else
    cb({
      type = "executable",
      command = get_python_path(),
      args = { "-m", "debugpy.adapter" },
      options = { source_filetype = "python" },
    })
  end
end
dap.configurations.python = require("config_plugins.config_dap_python")




local codicons = require("codicons")
codicons.setup({
	-- Override by mapping name to icon
	["account"] = "",
	-- Or by name to hexadecimal/decimal value
	["comment"] = 0xEA6B, -- hexadecimal
	["archive"] = 60056, -- decimal
})

require("dapui").setup()
require("nvim-dap-virtual-text").setup()


dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end


vim.keymap.set("n", "<leader>d", function()
  dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>c", function()
  dap.continue()
end, { desc = "Start/Continue Debugging" })

vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle DAP REPL" })
vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate Debugger" })


local ok_telescope, telescope = pcall(require, "telescope")
if ok_telescope then
  telescope.load_extension("dap")
end

local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
  cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
    sources = {
      { name = "dap" },
      { name = "buffer" },
    },
  })


end

require("config_plugins.config_dap_hydra_menu")
