return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "notify",
            find = "mason",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "LSP",
          },
          opts = { skip = true },
        },
      },
    },
  },
}
