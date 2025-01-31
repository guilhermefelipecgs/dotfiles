return {
  "https://git.sr.ht/~nedia/auto-format.nvim",
  event = "BufWinEnter",
  config = function()
    require("auto-format").setup()
  end
}
