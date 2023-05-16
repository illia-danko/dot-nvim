local M = {}

M.config = function()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    rainbow = {
      enable = true,
      disable = { "lua", "jsx", "tsx", "ts", "javascript", "json", "c", "cpp", "go" },
      extended_mode = true,
      max_file_lines = nil,
    },
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
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
      "typescript",
      "tsx",
    },
  })

  vim.g.markdown_folding = 1 -- enable markdown folding
end

return M
