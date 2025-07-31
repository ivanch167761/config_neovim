-- Filetype detection for Ansible YAML files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("AnsibleFT", { clear = true }),
  pattern = { "*.yml", "*.yaml" },
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})

-- Optionally ensure ansible-lint and ansible-language-server are installed via Mason
require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "ansiblels", "yamlls" } })

-- LSP setup for Ansible
local lspconfig = require("lspconfig")
lspconfig.ansiblels.setup({
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yaml.ansible" },
  settings = {
    ansible = {
      validation = {
        enabled = true,
        lint = { enabled = true },
      },
    },
    yaml = {
      hover = true,
      completion = true,
    },
  },
})


