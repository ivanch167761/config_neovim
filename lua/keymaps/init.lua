-- Load keymap modules
require("keymaps.core")
require("keymaps.telescope")
require("keymaps.snippets")
require("keymaps.dap")
require("keymaps.signature")
require("keymaps.ansible")




--local opts = { noremap = true, silent = true }
--vim.keymap.set("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
--vim.keymap.set("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
--vim.keymap.set("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
--vim.keymap.set("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

--DEBUGGER
--nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
--nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
--vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>)

