return {
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = {
      bind = true,
      doc_lines = 2,
      floating_window = true,
      floating_window_above_cur_line = true,
      handler_opts = { border = "rounded" },
      hint_enable = true,
      hint_prefix = "🐣 ",
      toggle_key = "<C-w>",
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
}

