return {
    "saghen/blink.cmp",
    opts = {
        documentation = { auto_show = false },
        keymap = {
            preset = "default",
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
        },
    },
}
