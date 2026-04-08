return {
    "saghen/blink.cmp",
    opts = {
        completion = {
            documentation = { auto_show = false },
        },
        keymap = {
            preset = "default",
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<CR>"] = { "select_and_accept", "fallback" },
        },
    },
}
