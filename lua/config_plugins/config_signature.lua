-- Managed by plugin `opts`, no additional setup needed here
-- Optionally, wrap lsp_signature in LspAttach autocmd if needed:
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- Works as fallback if signature didn't auto-init via opts
    require("lsp_signature").on_attach({}, args.buf)
  end,
})
