return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- LSP completion source
      'hrsh7th/cmp-nvim-lsp',
      -- Buffer & path sources
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      -- Friendly snippets collection
      'rafamadriz/friendly-snippets',
    },
  },
}
