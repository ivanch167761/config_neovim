-- Telescope keymaps
local tb = require("telescope.builtin")

vim.keymap.set("n", "<leader>gf", tb.git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", tb.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", tb.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", tb.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", tb.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", tb.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", tb.resume, { desc = "[S]earch [R]esume" })

