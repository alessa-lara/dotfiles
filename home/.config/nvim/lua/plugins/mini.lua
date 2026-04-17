return {
	{
		"nvim-mini/mini.keymap",
		opts = function(_, opts)
			local map_multistep = require("mini.keymap").map_multistep

			map_multistep("i", "<Tab>", { "pmenu_next" })
			map_multistep("i", "<S-Tab>", { "pmenu_prev" })
			map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
			map_multistep("i", "<BS>", { "minipairs_bs" })
			map_multistep("i", "<Tab>", { "blink_next" })
			map_multistep("i", "<S-Tab>", { "blink_prev" })
			map_multistep("i", "<CR>", { "blink_accept" })

			local map_combo = require("mini.keymap").map_combo

			-- Support most common modes. This can also contain 't', but would
			-- only mean to press `<Esc>` inside terminal.
			local mode = { "i", "c", "x", "s" }
			map_combo(mode, "jk", "<BS><BS><Esc>")

			-- To not have to worry about the order of keys, also map "kj"
			map_combo(mode, "kj", "<BS><BS><Esc>")

			-- Escape into Normal mode from Terminal mode
			map_combo("t", "jk", "<BS><BS><C-\\><C-n>")
			map_combo("t", "kj", "<BS><BS><C-\\><C-n>")
		end,
	},

	{
		"nvim-mini/mini.misc",
		opts = function(_, opts)
			require("mini.misc").setup_auto_root({
				".git",
				"src",
				"build",
				"CMakeLists.txt",
				"Cargo.toml",
				"*sln",
				".root",
			})
		end,
	},

	{ "nvim-mini/mini.pairs", opts = {} },

	{
		"nvim-mini/mini.comment",
		opts = {
			mappings = {
				comment_line = "<leader>ec",
				comment_visual = "<leader>ec",
			},
		},
	},

	{ "nvim-mini/mini.ai", opts = {} },

	{ "nvim-mini/mini.hipatterns", opts = {} },

	{ "nvim-mini/mini.icons", opts = {} },

	{
		"nvim-mini/mini.animate",
		opts = function(_, opts)
			local animate = require("mini.animate")
			return vim.tbl_deep_extend("force", opts, {
				resize = {
					timing = animate.gen_timing.linear({ duration = 25, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 75, unit = "total" }),
					-- optional: disable subscroll for single-line jumps (just a nice tweak)
					subscroll = animate.gen_subscroll.equal({
						predicate = function(total_scroll)
							return total_scroll > 1
						end,
					}),
				},
			})
		end,
	},

	{
		"nvim-mini/mini.statusline",
		opts = {
			use_icons = vim.g.have_nerd_font,
			content = {
				active = function()
					local orange = vim.api.nvim_get_hl(0, { name = "Orange" }).fg
					local purple = vim.api.nvim_get_hl(0, { name = "Purple" }).fg

					vim.api.nvim_set_hl(0, "StatuslineGit", { fg = "#181A1C", bg = orange, bold = true })
					vim.api.nvim_set_hl(0, "StatuslineRoot", { fg = "#181A1C", bg = purple, bold = true })

					local mode, mode_hl = MiniStatusline.section_mode({})
					local git = MiniStatusline.section_git({})

					local root = MiniMisc.find_root()
					if root == nil then
						root = vim.fn.expand("%:p:h")
					end
					root = root:gsub("^" .. (os.getenv("HOME") or ""), "")

					local buf_location = "L:%l|%L│C:%v"

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "StatuslineGit", strings = { git } },
						{ hl = "StatuslineRoot", strings = { root } },
						"%=",
						{ hl = mode_hl, strings = { buf_location } },
					})
				end,
			},
		},
	},

	{ "nvim-mini/mini.tabline", opts = {} },

	{
		"nvim-mini/mini.surround",
		opts = {
			mappings = {
				add = "<leader>esa", -- Add surrounding in Normal and Visual modes
				delete = "<leader>esd", -- Delete surrounding
				replace = "<leader>esr", -- Replace surrounding
			},
		},
	},
}
