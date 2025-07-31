-- Run playbook or role
vim.keymap.set("n", "<leader>ta", function()
  require("ansible").run()
end, { desc = "Ansible: Run current playbook", buffer = true, silent = true })

