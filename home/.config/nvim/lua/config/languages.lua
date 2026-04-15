return {
    cpp = {
        lsp = "clangd",
        treesitter = "cpp",
        lint = { "clang-tidy" },
    },
    python = {
        lsp = "pyright",
        treesitter = "python",
        lint = { "ruff" },
    },
    rust = {
        lsp = "rust_analyzer",
        treesitter = "rust",
    },
    lua = {
        lsp = "lua_ls",
        treesitter = "lua",
    },
    cmake = {
        lsp = "neocmakelsp",
        treesitter = "cmake",
        lint = { "cmake-lint" },
    },
    typescript = {
        lsp = "ts_ls",
        treesitter = "typescript",
        lint = { "eslint_d" },
    },
    svelte = {
        lsp = "svelte",
        treesitter = "svelte",
        lint = { "eslint_d" },
    },
}
