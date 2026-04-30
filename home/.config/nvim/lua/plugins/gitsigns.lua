return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
				end

				map("n", "<leader>ghd", gs.diffthis, "Diff This")
			end,
		},
	},
}
