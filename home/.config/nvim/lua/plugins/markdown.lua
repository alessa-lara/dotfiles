return {
	"MeanderingProgrammer/render-markdown.nvim",
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	keys = {
		{
			"<leader>or",
			function()
				require("render-markdown").toggle()
			end,
			desc = "[R]ender Markdown",
		},
	},

	{
		"obsidian-nvim/obsidian.nvim",
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			workspaces = {
				{ name = "computer-science-notes", path = "~/Documents/Markdown/comp-sci-notes/" },
			},
            legacy_commands = false
		},
	},

	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown",
		opts = {},
	},
}
