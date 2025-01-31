return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "BufEnter",
  config = function()
    local groups = require("bufferline").groups

    require("bufferline").setup {
      options = {
        always_show_bufferline = false,
        tab_size = 3,
        max_name_length = 50,
        show_buffer_icons = false,
        numbers = function(opts)
          local state = require("bufferline.state")

          for i, buf in ipairs(state.components) do
            if buf.id == opts.id then return i end
          end

          return opts.ordinal
        end,
        groups = {
          items = {
            groups.builtin.ungrouped,
            {
              name = "Test",
              icon = "󰂓",
              matcher = function(buf)
                return buf.path:match("test/")
              end
            },
            {
              name = "External",
              icon = "",
              auto_close = true,
              matcher = function(buf)
                return buf.path:match("zipfile://")
              end
            },
          }
        },
      },
    }

    vim.api.nvim_create_autocmd({ "BufLeave" }, {
      pattern = { "*" },
      command = "lua require('bufferline.ui').refresh()",
    })
  end,
  keys = {
    { "<leader>1",   "<cmd>BufferLineGoToBuffer 1<cr>" },
    { "<leader>2",   "<cmd>BufferLineGoToBuffer 2<cr>" },
    { "<leader>3",   "<cmd>BufferLineGoToBuffer 3<cr>" },
    { "<leader>4",   "<cmd>BufferLineGoToBuffer 4<cr>" },
    { "<leader>5",   "<cmd>BufferLineGoToBuffer 5<cr>" },
    { "<leader>6",   "<cmd>BufferLineGoToBuffer 6<cr>" },
    { "<leader>7",   "<cmd>BufferLineGoToBuffer 7<cr>" },
    { "<leader>8",   "<cmd>BufferLineGoToBuffer 8<cr>" },
    { "<leader>9",   "<cmd>BufferLineGoToBuffer 9<cr>" },
    { "<leader>0",   "<cmd>BufferLineGoToBuffer 99<cr>" },
    { "<leader>w",   "<cmd>Bdelete<cr>" },
    { "<leader>bco", "<cmd>BufferLineCloseOthers<cr>" },
  }
}
