return {
	"saghen/blink.cmp",
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		completion = {
			menu = {
				auto_show = true,
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},

			keyword = { range = "full" },
			list = { selection = { preselect = false, auto_insert = true } },
			ghost_text = { enabled = true },
		},

		sources = {
            default = { "lsp", "path", "snippets" },
		},
	},
}
