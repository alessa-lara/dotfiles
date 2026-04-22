return {
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.sonokai_style = "maia"
			vim.g.sonokai_transparent_background = "1"
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_enable_bold = 1
			vim.cmd.colorscheme("sonokai")

			-- define highlight for markdown bold and italic
			local blue = vim.api.nvim_get_hl(0, { name = "Blue" }).fg
			local red = vim.api.nvim_get_hl(0, { name = "Red" }).fg
			vim.api.nvim_set_hl(0, "TSStrong", { fg = red, bold = true })
			vim.api.nvim_set_hl(0, "@markup.italic", { fg = blue, italic = true })
		end,
	},
}
