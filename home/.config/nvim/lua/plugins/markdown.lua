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
		"yousefhadder/markdown-plus.nvim",
		ft = "markdown",
		opts = {},
	},
}
