return {
	cpp = {
		treesitter = "cpp",
		lint = { "clang-tidy" },
	},
	python = {
		treesitter = "python",
		lint = { "ruff" },
	},
	rust = {
		treesitter = "rust",
	},
	lua = {
		treesitter = "lua",
	},
	cmake = {
		treesitter = "cmake",
		lint = { "cmake-lint" },
	},
	typescript = {
		treesitter = "typescript",
		lint = { "eslint_d" },
	},
	svelte = {
		treesitter = "svelte",
		lint = { "eslint_d" },
	},
}
