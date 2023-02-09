local M = {}

M.setup = function(use)
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = { "nvim-treesitter/playground", "p00f/nvim-ts-rainbow" },
    config = M.treesitter,
  })
end

M.treesitter = function()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
    },
    rainbow = {
      enable = true,
      disable = { "lua", "jsx", "javascript", "json", "c", "cpp", "go" },
      extended_mode = true,
      max_file_lines = nil,
    },
    ensure_installed = {
      "go",
      "javascript",
      "yaml",
      "json",
      "lua",
      "clojure",
      "commonlisp",
      "scheme",
      "fennel",
      "python",
      "markdown",
      "markdown_inline",
      "elm",
      "bash",
      "vim",
      "html",
      "css",
      "query",
      "ruby",
      "cpp",
      "sql",
      "make",
      "rust",
      "http",
      "comment",
    },
  })

  vim.g.markdown_folding = 1 -- enable markdown folding
end

return M