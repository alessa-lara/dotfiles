return {
	"saghen/blink.cmp",
	version = not vim.g.lazyvim_blink_main and "*",
    event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		fuzzy = { implementation = "lua" },

		keymap = { preset = "none" },

		completion = {
			documentation = { auto_show = false },
		},

		sources = {
			default = { "lsp", "path", "snippets" },
		},

		cmdline = {
			enabled = true,
			keymap = {
				preset = "cmdline",
				["<Right>"] = false,
				["<Left>"] = false,
			},

			completion = {
				list = { selection = { preselect = false } },

				menu = {
					auto_show = function(ctx)
						return vim.fn.getcmdtype() == ":"
					end,
				},

				ghost_text = { enabled = true },
			},
		},
	},
}
