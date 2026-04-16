-- makeprg python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		local main = MiniMisc.find_root() .. "/main.py"
		if vim.fn.filereadable(main) == 1 then
			vim.bo.makeprg = "python " .. main
		else
			vim.bo.makeprg = "python %"
		end
	end,
})
