return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
  }
}
