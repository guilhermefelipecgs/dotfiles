return {
  "folke/trouble.nvim",
  opts = {},
  keys = {
    { "<leader>r", "<cmd>Trouble lsp_references toggle focus=true<cr>", desc = "References" },
    { "<leader>d", "<cmd>Trouble diagnostics toggle focus=true<cr>",    desc = "Diagnostics" },
  }
}
