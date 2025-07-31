-- General keymaps

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Word wrap navigation
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>r", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Misc
vim.keymap.set("n", "<esc>", ":noh<cr>") -- Clear highlights
vim.keymap.set("i", "<Space>", "<Space><C-G>u") -- Granular undo

-- Insert blank lines above/below
vim.keymap.set("n", "[<Space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<CR>")
vim.keymap.set("n", "]<Space>", ":<c-u>put =repeat(nr2char(10), v:count1)<CR>")
vim.keymap.set("n", "{<Space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<CR>")
vim.keymap.set("n", "}<Space>", ":<c-u>put =repeat(nr2char(10), v:count1)<CR>")

-- Indent reselect
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Trim trailing whitespace
vim.keymap.set("n", "<silent> ,<Space>", ":<C-u>silent! keeppatterns %substitute/\\s\\+$//e<CR>")

-- Move code blocks
vim.api.nvim_set_keymap("v", "<A-j>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })

