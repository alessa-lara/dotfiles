return {
  {
    "ray-x/starry.nvim",
    version = "*",

    opts = {
      border = false,
      disable = {
        background = true,
      },

      style = {
        disable = {
          "underdouble",
          "undercurl",
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai",
    },
  },
}
