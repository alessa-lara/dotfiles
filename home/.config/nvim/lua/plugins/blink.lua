return {
	"saghen/blink.cmp",
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		fuzzy = { implementation = "lua" },

		keymap = { preset = "none" },

		completion = {
			menu = { draw = { treesitter = { "lsp" } } },
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
