-- File: lua/config_plugins/dap_hydra.lua
local Hydra = require("hydra")
local dap = require("dap")
local dapui = require("dapui")



Hydra({
  name = "DAP",
  hint = [[
 _c_: continue    _o_: step over   _i_: step into   _u_: step out
 _b_: toggle bp   _r_: REPL        _t_: terminate   _x_: close UI
 ^ ^              _q_: quit hydra
  ]],
  color = 'pink',
  config = {
    invoke_on_body = true,
    hint = {
      border = "rounded",
      position = "bottom",
    },
  },
  mode = "n",
  body = "<leader>dh",
  heads = {
    { "c", dap.continue, { desc = "Continue" } },
    { "o", dap.step_over, { desc = "Step Over" } },
    { "i", dap.step_into, { desc = "Step Into" } },
    { "u", dap.step_out, { desc = "Step Out" } },
    { "b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" } },
    { "x", dapui.close, { desc = "Close DAP UI" } },
    { "q", nil, { exit = true, desc = "Quit Hydra" } },
  },
})



