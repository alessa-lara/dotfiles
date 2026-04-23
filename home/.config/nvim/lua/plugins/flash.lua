return {
	"folke/flash.nvim",
	lazy = false,
	opts = {
		search = {
			mode = "fuzzy",
		},
	},
	keys = {
		{
			"<leader>s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "[S]earch",
		},
	},
}
