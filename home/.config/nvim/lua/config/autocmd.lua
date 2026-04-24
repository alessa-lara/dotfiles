local markdown_group = vim.api.nvim_create_augroup("MarkdownSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	group = markdown_group,
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.wrapmargin = 10
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 8
		vim.opt_local.shiftwidth = 8
	end,
})
