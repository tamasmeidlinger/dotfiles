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

      local function set_flash_highlights()
        local label = { fg = "#9ece6a", bg = "NONE", bold = true }
        vim.api.nvim_set_hl(0, "FlashLabel", label)
        vim.api.nvim_set_hl(0, "FlashCurrent", label)
      end

      local group = vim.api.nvim_create_augroup("flash_custom_highlights", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = set_flash_highlights,
      })
      set_flash_highlights()
    end,
  },
}
