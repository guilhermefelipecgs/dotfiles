return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  opts = {
    backgorund = {
      dark = "dragon"
    }
  },
  config = function()
    vim.cmd.colorscheme "kanagawa-dragon"
  end
}
