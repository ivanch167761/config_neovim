

-- lua/plugins/lazy.lua
return {
  -- 1) ToggleTerm for in-Neovim terminals
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        -- default float, curved border
        direction       = "float",
        float_opts      = { border = "curved", winblend = 0 },
        open_mapping    = [[<c-\>]],
        insert_mappings = true,
        start_in_insert = true,
        persist_size    = true,
        shading_factor  = 2,
      }
    end,
  },

  -- 2) LazyGit integration (no `setup` call!)
  {
    "kdheepak/lazygit.nvim",
    lazy = true,         -- load on demand
    cmd  = { "LazyGit" },-- define :LazyGit command
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
