return {
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        opts = {
            delay = 0,
            icons = { mappings = vim.g.have_nerd_font },

            -- keybind groups
            spec = {

                { "<leader>c", group = "[C]ode", mode = { "n", "v" } },
                { "<leader>b", group = "[B]uffers", mode = { "n", "v" } },
                { "<leader>f", group = "[F]iles", mode = { "n", "v" } },
                { "<leader>d", group = "[D]ebug", mode = { "n", "v" } },
                { "<leader>r", group = "[R]un", mode = { "n", "v" } },
                { "<leader>w", group = "[W]indows", mode = { "n", "v" } },
                { "<leader>e", group = "[E]dit", mode = { "n", "v" } },
                { "<leader>es", group = "[S]urrounds", mode = { "n", "v" } },
                { "gr", group = "LSP Actions", mode = { "n" } },
            },
        },
    },
}
