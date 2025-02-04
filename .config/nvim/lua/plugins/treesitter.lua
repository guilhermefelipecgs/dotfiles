return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      highlight = {
        enable = true,
        disable = function(lang, buffnr)
          return lang ~= "markdown"
        end
      },
    })
  end
}
