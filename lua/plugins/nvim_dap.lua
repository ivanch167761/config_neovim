return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({ ensure_installed = { "firefox", "node2" } })
		end,
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"anuvyklack/hydra.nvim",
		"nvim-telescope/telescope-dap.nvim",
		"rcarriga/cmp-dap",
		"mfussenegger/nvim-dap-python",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"folke/neodev.nvim",
	},
}
