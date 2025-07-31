-- Toggle or manually invoke signature help
vim.keymap.set("n", "<C-w>", function()
  require("lsp_signature").toggle_float_win()
end, { silent = true, desc = "Toggle Signature Win" })

vim.keymap.set("n", "<C-k>", function()
  vim.lsp.buf.signature_help()
end, { silent = true, desc = "Signature Help" })
