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
              name = "test",
              -- icon = "󰂓",
              matcher = function(buf)
                return buf.path:match("/test/")
              end
            },
            {
              name = "ext",
              -- icon = "",
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
    { "<leader>1",  "<cmd>lua require('bufferline').go_to(1, true)<cr>",  desc = "Buffer 1" },
    { "<leader>2",  "<cmd>lua require('bufferline').go_to(2, true)<cr>",  desc = "Buffer 2" },
    { "<leader>3",  "<cmd>lua require('bufferline').go_to(3, true)<cr>",  desc = "Buffer 3" },
    { "<leader>4",  "<cmd>lua require('bufferline').go_to(4, true)<cr>",  desc = "Buffer 4" },
    { "<leader>5",  "<cmd>lua require('bufferline').go_to(5, true)<cr>",  desc = "Buffer 5" },
    { "<leader>6",  "<cmd>lua require('bufferline').go_to(6, true)<cr>",  desc = "Buffer 6" },
    { "<leader>7",  "<cmd>lua require('bufferline').go_to(7, true)<cr>",  desc = "Buffer 7" },
    { "<leader>8",  "<cmd>lua require('bufferline').go_to(8, true)<cr>",  desc = "Buffer 8" },
    { "<leader>9",  "<cmd>lua require('bufferline').go_to(9, true)<cr>",  desc = "Buffer 9" },
    { "<leader>0",  "<cmd>lua require('bufferline').go_to(99, true)<cr>", desc = "Buffer last" },
    { "<leader>w",  "<cmd>Bdelete<cr>",                                   desc = "Buffer close" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>",                     desc = "Buffer close others" },
    { "<leader>ba", "<cmd>BufferLineCloseOthers<cr><cmd>Bdelete<cr>",     desc = "Buffer close all" },
  }
}
