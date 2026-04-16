return {
	{
		"stevearc/overseer.nvim",
		opts = {},
		keys = {
			{ "<leader>rl", "<cmd>OverseerToggle!<cr>", desc = "Task list" },
			{ "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Run task" },
			{ "<leader>ra", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
		},
	},

	{
		"pianocomposer321/officer.nvim",
		dependencies = "stevearc/overseer.nvim",
		config = function()
			require("officer").setup({
				create_mappings = false,
			})
		end,
		keys = {
			{ "<leader>rm", ":Make<CR>", desc = "[M]ake" },
			{ "<leader>rM", ":Make ", desc = "[M]ake with args" },
			{ "<leader>rc", ":Run ", desc = "[C]ommand" },
		},
	},
}
