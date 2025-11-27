return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()

    vim.lsp.config('clojure_lsp', {
      root_dir = vim.fn.getcwd(),
    })
  end
}
