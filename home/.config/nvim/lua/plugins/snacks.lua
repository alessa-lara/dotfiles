return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            dashboard = { enabled = true },
            dim = { enabled = true },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            terminal = { enabled = true },
        },
        keys = {
            {
                "<leader>t",
                function()
                    Snacks.terminal()
                end,
                desc = "Terminal",
            },
            {
                "<leader>fe",
                function()
                    Snacks.explorer()
                end,
                desc = "Explorer",
            },
            {
                "<leader>bl",
                function()
                    Snacks.picker.buffers()
                end,
                desc = "[L]ist Buffers",
            },
            {
                "<leader>bd",
                function()
                    Snacks.bufdelete()
                end,
                desc = "[D]elete Buffer",
            },
            {
                "<leader>fp",
                function()
                    Snacks.picker.projects()
                end,
                desc = "[P]rojects",
            },
            {
                "<leader><space>",
                function()
                    Snacks.picker.files()
                end,
                desc = "[F]ile Search",
            },
            {
                "<leader>cd",
                function()
                    Snacks.picker.diagnostics()
                end,
                desc = "[D]iagnostics",
            },
            {
                "<leader>n",
                function()
                    Snacks.picker.notifications()
                end,
                desc = "[N]otification History",
            },
        },
    },
}
