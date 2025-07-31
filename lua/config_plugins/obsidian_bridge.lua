return {
	"oflisback/obsidian-bridge.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("obsidian-bridge").setup({
			obsidian_server_address = "http://localhost:27124",
		})
	end,
	event = {
		"BufReadPre *.md",
		"BufNewFile *.md",
	},
	lazy = true,
}
