return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.lsp.enable("pyright")
            vim.lsp.enable("clangd")
            vim.lsp.enable("rust_analyzer")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("neocmakelsp")
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("svelte")
            vim.lsp.enable("markdown_oxide")
            vim.lsp.enable("asm-lsp")
        end,
    },
}
