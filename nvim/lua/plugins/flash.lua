return {
  {
    "folke/flash.nvim",
    opts = {
      label = {
        rainbow = {
          enabled = false,
        },
      },
    },
    config = function(_, opts)
      require("flash").setup(opts)
    end,
  },
}
