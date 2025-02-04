return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      backgorund = {
        dark = "dragon"
      },
      overrides = function(colors)
        local theme = colors.theme

        return {
          RenderMarkdownH1Bg = { bg = theme.ui.bg_p1 },
          RenderMarkdownH2Bg = { bg = theme.ui.bg_p2, fg = theme.ui.fg },
          RenderMarkdownH3Bg = { bg = theme.diff.add, fg = theme.diag.ok },
          RenderMarkdownH4Bg = { bg = theme.diff.change, fg = theme.diag.info },
          RenderMarkdownH5Bg = { bg = theme.diff.text, fg = theme.diag.warning },
          RenderMarkdownH6Bg = { bg = theme.diff.delete, fg = theme.diag.error },

          RenderMarkdownBullet = { fg = theme.diag.warning },
          RenderMarkdownCode = { bg = theme.ui.bg_m2 },
        }
      end
    })
    vim.cmd.colorscheme "kanagawa-dragon"
  end
}
