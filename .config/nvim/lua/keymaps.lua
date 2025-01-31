return {
  { "<leader>n", "<cmd>:e $HOME/Documents/todo.md<cr>",               desc = "Notes" },
  { "<leader>k", "<cmd>:e $HOME/.config/nvim/lua/keymaps.lua<cr>",    desc = "Keymaps" },
  { "<leader>r", "<cmd>Trouble lsp_references toggle focus=true<cr>", desc = "References" },
  { "<F2>",      "<cmd>lua vim.lsp.buf.rename()<cr>",                 desc = "Rename" },
  { "<F4>",      "<cmd>lua vim.lsp.buf.code_action()<cr>",            desc = "Code Actions" },
  { "<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>",                  desc = "Hover" },
  { "<leader>s", "<cmd>lua vim.lsp.buf.signature_help()<cr>",         desc = "Signature" },
}
