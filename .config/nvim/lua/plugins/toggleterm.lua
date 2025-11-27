return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<c-\>]],
      on_open = function(term)
        vim.cmd('setlocal signcolumn=no')
        vim.defer_fn(function()
          vim.wo[term.window].winbar = ""
        end, 0)
      end
    })

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit  = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "curved",
        width = vim.o.columns - 14,
        height = vim.o.lines - 5
      },
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end
  end
}
