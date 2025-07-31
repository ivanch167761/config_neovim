return {
  {
    "mfussenegger/nvim-ansible",
    ft = { "yaml.ansible", "yaml" },
    keys = {
      { "<leader>ta", function() require("ansible").run() end, desc = "Ansible: Run Playbook/Role", silent = true },
    },
  },
}
