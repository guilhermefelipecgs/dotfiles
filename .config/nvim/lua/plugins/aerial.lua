return {
  'stevearc/aerial.nvim',
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    layout = {
      default_direction = "left"
    },
    close_on_select = true,
  },
  keys = {
    { "<leader>o", "<cmd>AerialToggle<cr>", desc = "Outline" }
  }
}
